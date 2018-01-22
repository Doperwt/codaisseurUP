class PagesController < ApplicationController
  def home
    @lastthreevents = Event.last(3)
    # @events = Event.all
    random_event
    @booking_count = total_bookings_made
    @outdoor_remaining = outdoor_spot_count - outdoor_booked
  end

  def index
    @search = params[:search]
    @events = Event.where('name ILIKE ?',"%#{@search.strip}%")
    @events.need_sort(params[:search_by])
  end
  private
  def random_event
    @random = Event.order("RANDOM()").first
  end
  def total_bookings_made
    Booking.booking_count
  end
  def outdoor_spot_count
    Event.outdoor_count
  end
  def outdoor_booked
    Booking.outdoor_booked
  end
  def need_sorting
    Event.need_sort
  end
end
