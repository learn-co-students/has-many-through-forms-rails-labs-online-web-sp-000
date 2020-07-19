class CategoriesController < ApplicationController

  def create
    @category = Category.find_or_create_by(name: name)
  end

  def show
    @category = Category.find(params[:id])
  end
end
