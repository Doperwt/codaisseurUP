class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :bookevent]
  before_action :all_categories, only: [ :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show
    if current_user
      @valid_user = @event.validate_user?(current_user)
    end
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      image_params.each do |image|
        @event.photos.create(image: image)
      end
      redirect_to @event, notice: "Event created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      image_params.each do |image|
        @event.photos.create(image: image)
      end
      redirect_to @event, notice: "Event updated"
    else
      render :edit
    end
  end

  def bookevent
    @booking = current_user.bookings.build(event: @event)
  end
  def createbooking
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to root, notice: "Booking created"
    else
      render :bookevent
    end
  end
  private

  def set_event
    @event = Event.find(params[:id])
    @owner = User.find(@event.user_id)
    @photos = @event.photos
    @categories = @event.categories
  end
  def all_categories
    @categories = Category.all
  end
  def event_params
    params
    .require(:event)
    .permit(
      :name, :size, :description, :location, :image_url, :includes_drinks,
      :includes_food, :starts_at, :ends_at, :active, :price, category_ids: []
    )
  end
  def image_params
    params[:images].present? ? params.require(:images) : []
  end
  def booking_params
    params.require(:booking).permit( :group_size)
  end


end
