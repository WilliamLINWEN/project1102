class CategoriesController < ApplicationController
	def get_sub_category
    render json: Category.where(parent_id: params[:id]).select(:id, :name)
	end
end
