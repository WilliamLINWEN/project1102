class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@category = find_category
  	if @category
  		@rooms = @category.chatrooms
  	else
  		@categories = Category.main_categories.each_slice(4)
  		render 'categories'
  	end
  end

  private

  def find_category
  	return false if params[:category_id].nil?
  	category = Category.find_by(id: params[:category_id])
  	return false if category.nil?
  	category
  end
end
