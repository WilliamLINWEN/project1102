# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chinese_names = "黃美佳、張姿君、王如芳、曾家維、黃惠珊、溫惠君、蔡涵怡、蔡寧喜、黃建銘、林嘉慧、吳雅惠、游俊嘉、林建謙、呂雅婷、黃俊秋、阮怡婷、張湘林、張士豪、楊俊翔、吳仰裕、林怡富、魏涵學、白旻珮、李佩美、許弘伶、曹俊銘、郭欣儀、林奇書、饒仁羽、吳俊傑、陳宗岳、袁育如、張詩涵、盧阿源、胡雅婷、陳愛岳、陳良育、吳美君、胡建霖、楊家豪、馮凡奇、張弘隆、林士吉、孫俊賢、王怡婷、詹韋東、楊世文、王憲源、郭人豪、張佩樺、王琬婷、王惠婷、黃詩虹、黃國華、蔡之夢、江佳霖、劉中男、潘怡靜、黃孟璇、吳子芸、吳俊諺、朱枝豪、張怡璇、曹俊毅、蔡秉帆、涂宜靜、高建舜、蔡孟威、徐妤琴、李佳康、林義群、陳善如、林芷恒、蔡雲皓、吳亮茵、劉雅瑜、吳嬌亦、李奎杰、孫毅為、梁虹潔、黃育萱、鄭淑博、詹靖樂、李秀辛、陳鈺婷、蔡承瑄、謝石芬、楊建安、楊玉鳳、鄧勇福、魏如喬、余竣白、沈萱伶、許俊廷、張麗萍、黃南柔、林偉倫、陳筠妮、林欣怡、洪靜如".split('、')
ori_emails = User.all.collect(&:email)

10.times do |i|
	while true
		user_email = "user#{Random.new.rand(100)}@mail.com"
		break unless ori_emails.include?(user_email)
	end
	user = User.new
	user.email = user_email
	user.password = 'password'
	user.save
	puts "create user #{user.email}"
end

users = User.all

5.times do |j|
	user = users[Random.new.rand(users.count - 1)]
	room = user.chatrooms.create(title: "#{chinese_names[Random.new.rand(chinese_names.length - 1)]}的聊天室")
	puts "create chatroom #{Chatroom.last.title}"
end