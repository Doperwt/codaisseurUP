class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  def index
    @categories = Catagory.all
  end
  def show ;  end
  def edit ;  end
  private
  def set_category
    @category = Category.find(params[:id])
  end
end
