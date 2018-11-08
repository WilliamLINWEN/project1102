class BroadcasrUserAppearJob < ApplicationJob
  queue_as :default

  def perform(room, appear)
  	if appear
	    participants = room.participants.where(appearance: true).collect{ |p| p.user.slice(:avatar, :email, :number) }
	    ActionCable.server.broadcast("appearance_#{room.number}",
	                                 users: participants,
	                                 current_time: Time.now.strftime('%Y/%m/%d %H:%M:%S'),
	                                 appear: 'true')
	  else
	  	participants = room.participants.where(appearance: false).collect{ |p| p.user.slice(:number) }
	    ActionCable.server.broadcast("appearance_#{room.number}",
	                                 users: participants,
	                                 appear: 'false')
	  end
  end
end
