class CategoriesController < ApplicationController

  def show
    @themes = @room.themes
  end
end
