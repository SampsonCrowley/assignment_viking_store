# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  User.create(name:   Faker::Name.name,
              email:  Faker::Internet.free_email)
end

User.find_each do |u|
  3.times do
    Card.create(
                userid: u.id,
                last_four: rand(1000..9999),
                nickname: [nil, 'biz', 'house'].sample,
                merchant_id: Array.new(9){[*"A".."Z", *"0".."9"].sample}.join,
                merchant_card_id: Array.new(9){[*"A".."Z", *"0".."9"].sample}.join
    )
  end
end
