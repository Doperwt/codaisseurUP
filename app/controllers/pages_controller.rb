class PagesController < ApplicationController
  def home
    @lastthreevents = Event.last(3)
    # @events = Event.all
    random_event
  end

  def index
    @events = Event.where('name ILIKE ?',"%#{params[:search].strip}%")
  end
  private
  def random_event
    first = Event.last.id
    last = Event.last.id
    @random = Event.find(rand(first..last))
  end
end
