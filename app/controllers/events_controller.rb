class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :all_categories, only: [:show, :edit, :update]
   before_action :authenticate_user!, except: [:show]

   def index
     @events = current_user.events
   end

   def show
     @valid_user = @event.validate_user?(current_user)
   end

   def new
     @event = current_user.events.build
     @categories = Category.all
   end

   def create
     @event = current_user.events.build(event_params)

     if @event.save
       redirect_to @event, notice: "Event created"
     else
       render :new
     end
   end

   def edit; end

   def update
     if @event.update(event_params)
       redirect_to @event, notice: "Event updated"
     else
       render :edit
     end
   end

   private

   def set_event
     @event = Event.find(params[:id])
   end
   def all_categories
     @categories = Category.all
   end
   def event_params
     params
       .require(:event)
       .permit(
         :name, :size, :description, :location, :image_url, :includes_drinks,
         :includes_food, :starts_at, :ends_at, :active, :price, :categories
       )
   end


end
