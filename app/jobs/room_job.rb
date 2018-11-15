require 'net/http'

class RoomJob < ApplicationJob
  queue_as :default

  def perform(chatroom)
     while true
      image_url = "https://picsum.photos/200/300/?image=" + Random.new.rand(1000).to_s
      uri = URI(image_url)
      res = Net::HTTP.get_response(uri)
      break if res.code == '200'
    end
    chatroom.update(cover_image: image_url)
  end
end
