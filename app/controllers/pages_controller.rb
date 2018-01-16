class PagesController < ApplicationController
  def home
    @lastthreevents = Event.last(3)
  end

  private
end
