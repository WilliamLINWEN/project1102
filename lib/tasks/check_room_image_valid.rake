require 'net/http'
namespace :check_room_image_valid do
	task start_check: :environment do
		Chatroom.all.each do |room|
			puts "Check #{room.title}"
			image_url = room.cover_image
			while(!check_image_valid(image_url))
				num = Random.new.rand(1000)
				puts "Random num = #{num}"
				image_url = "https://picsum.photos/200/300/?image=" + num.to_s
			end
			if room.cover_image != image_url
				room.update(cover_image: image_url)
				puts "update #{room.title}"
			end
		end
	end
end

def check_image_valid(image_url)
	return false if image_url.nil?
	uri = URI(image_url)
	res = Net::HTTP.get_response(uri)
	return res.code == '200'
end