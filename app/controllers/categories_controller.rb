class CategoriesController < ApplicationController
	def index
		@categories = Category.main_categories.each_slice(4)
	end

	def get_sub_category
    render json: Category.where(parent_id: params[:id]).select(:id, :name)
	end
end
