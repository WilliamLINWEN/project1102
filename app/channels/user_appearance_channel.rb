class UserAppearanceChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.warn ('-------------subscribed---------------------------')
    stream_from "appearance_#{params[:room_number]}"
    user_appear
  end

  def unsubscribed
    user_disappear
  end

  def user_appear
    current_user.appear_on(params[:room_number])
  end

  def user_disappear
    current_user.appear_down(params[:room_number])
  end
end
