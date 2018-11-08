class UserAppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_#{params[:room_number]}"
    user_appear
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def user_appear
  	current_user.appear_on(params[:room_number])
  end
end
