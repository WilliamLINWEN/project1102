class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@rooms = Chatroom.all
  end
end
