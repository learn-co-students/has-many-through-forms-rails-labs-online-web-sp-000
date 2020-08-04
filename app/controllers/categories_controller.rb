class CategoriesController < ApplicationController

#show page 
  def show
    @category = Category.find(params[:id])
  end
end
