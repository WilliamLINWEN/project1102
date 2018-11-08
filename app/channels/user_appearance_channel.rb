class UserAppearanceChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.warn ('-------------subscribed---------------------------')
    stream_from "appearance_#{params[:room_number]}"
    user_appear
  end

  def unsubscribed
    Rails.logger.warn ('-------------unsubscribed---------------------------')
    Rails.logger.warn params[:room_number]
    Rails.logger.warn ('-------------unsubscribed---------------------------')
    current_user.appear_down(params[:room_number])
  end

  def user_appear
    current_user.appear_on(params[:room_number])
  end
end
