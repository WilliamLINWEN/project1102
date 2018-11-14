namespace :generate_room do
	task create_chatrooms: :environment do
		Category.sub_categories.each do |cat|
			rooms = cat.chatrooms
			next if rooms.count >= 6
			diff = 6 - rooms.count
			diff.times do |i|
				user = User.all.sample
				title = "討論室#{i} 關於「#{cat.name}」"
				user.chatrooms.create(title: title, category_id: cat.id)
			end
		end
	end
end
