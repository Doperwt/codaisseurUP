class BookingsController < ApplicationController
  before_action :set_event, only: [:new,:create]
  def index

  end
  
  def new
    @booking = current_user.bookings.build
  end

  def create
    @booking = current_user.bookings.build(booking_params.merge({event: @event}))
    if @booking.save
      redirect_to event_path(@event.id), notice: "Booking created"
    else
      render :new
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end
  def booking_params
    params.require(:booking).permit( :group_size)
  end
end
