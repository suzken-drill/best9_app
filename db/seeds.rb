# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |i|
	team = Team.new(name: "テストチーム#{i}", author: "テスト監督#{i}", discription: "流し込みで登録したテストチーム#{i}です")
	team.save
	9.times do |j|
		Member.create(team_id: team.id, order: j + 1, name: "メンバー#{j + 1}", memo: "メモ#{j + 1}")
	end
end
