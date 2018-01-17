class PagesController < ApplicationController
  def home
    @lastthreevents = Event.last(3)
    # @events = Event.all

    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order("created_at DESC")
    end
  end

  def show
    @events = Event.where('name ILIKE ?',"%#{params[:search].strip}%")
  end
  private
end
