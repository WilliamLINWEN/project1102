FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :content do |n|
  	"Message content #{n}"
  end

  factory :user do
    email
    password { "verypassword" }
  end

  factory :chatroom do
    title { "room title" }
    after(:build) { |room| room.class.skip_callback(:commit, :after, :assign_master_id) }
  end

  factory :message do
  	content
  	user
  	chatroom
    after(:build) do |room|
    	room.class.skip_callback(:commit, :after, :broadcast_message)
    end
  end
end
