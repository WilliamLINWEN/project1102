class ChatroomsController < ApplicationController
  def show
    begin
      @room = Chatroom.friendly.find(params[:id])
      current_user.chatrooms << @room unless current_user.chatrooms.include? @room
      @messages = @room.messages.order(created_at: :desc).limit(20).reverse
    rescue => e
      redirect_to root_path
    end
  end

  def new
    @room = Chatroom.new
    @categories = Category.main_categories
    @sub_categories = @categories.first.children
    render layout: false
  end

  def create
    begin
      if current_user.chatrooms.create(chatroom_params)
        redirect_to root_path, notice: 'Success'
      else
        redirect_to root_path, notice: 'Fail'
      end
    rescue => e
      redirect_to root_path, notice: e
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:title, :category_id)
  end
end
