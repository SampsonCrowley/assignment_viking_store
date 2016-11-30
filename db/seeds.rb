# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#`rake db:migrate:reset`

5.times do
  User.create(name:   Faker::Name.name,
              email:  Faker::Internet.free_email)
end

User.find_each do |u|
  3.times do |n|
    Card.create(
                userid: u.id,
                last_four: rand(1000..9999),
                nickname: [nil, 'biz', 'house'].sample,
                merchant_id: Array.new(9){[*"A".."Z", *"0".."9"].sample}.join,
                merchant_card_id: (Array.new(9){[*"A".."Z", *"0".."9"].sample} << n).join
    )
  end
end



states = [ ["AK", "Alaska"],
  ["AL", "Alabama"],
  ["AR", "Arkansas"],
  ["AS", "American Samoa"],
  ["AZ", "Arizona"],
  ["CA", "California"],
  ["CO", "Colorado"],
  ["CT", "Connecticut"],
  ["DC", "District of Columbia"],
  ["DE", "Delaware"],
  ["FL", "Florida"],
  ["GA", "Georgia"],
  ["GU", "Guam"],
  ["HI", "Hawaii"],
  ["IA", "Iowa"],
  ["ID", "Idaho"],
  ["IL", "Illinois"],
  ["IN", "Indiana"],
  ["KS", "Kansas"],
  ["KY", "Kentucky"],
  ["LA", "Louisiana"],
  ["MA", "Massachusetts"],
  ["MD", "Maryland"],
  ["ME", "Maine"],
  ["MI", "Michigan"],
  ["MN", "Minnesota"],
  ["MO", "Missouri"],
  ["MS", "Mississippi"],
  ["MT", "Montana"],
  ["NC", "North Carolina"],
  ["ND", "North Dakota"],
  ["NE", "Nebraska"],
  ["NH", "New Hampshire"],
  ["NJ", "New Jersey"],
  ["NM", "New Mexico"],
  ["NV", "Nevada"],
  ["NY", "New York"],
  ["OH", "Ohio"],
  ["OK", "Oklahoma"],
  ["OR", "Oregon"],
  ["PA", "Pennsylvania"],
  ["PR", "Puerto Rico"],
  ["RI", "Rhode Island"],
  ["SC", "South Carolina"],
  ["SD", "South Dakota"],
  ["TN", "Tennessee"],
  ["TX", "Texas"],
  ["UT", "Utah"],
  ["VA", "Virginia"],
  ["VI", "Virgin Islands"],
  ["VT", "Vermont"],
  ["WA", "Washington"],
  ["WI", "Wisconsin"],
  ["WV", "West Virginia"],
  ["WY", "Wyoming"] ]


states.each do |state|
  State.create(abbr:state[0], full:state[1])
end

state_ids = State.pluck(:id)

User.find_each do |u|
  2.times do |n|
    Address.create(
                  userid: u.id,
                  shipping: (n < 1 ? true : false),
                  billing: (n < 1 ? false : true),
                  address: Faker::Address.street_address,
                  address_2: Faker::Address.secondary_address,
                  city: Faker::Address.city_suffix,
                  stateid: state_ids.sample,
                  zip: Faker::Address.zip
    )
  end
end
