require 'nokogiri'
require 'open-uri'
require 'faker'

doc = Nokogiri::HTML(URI.open("https://www.iqair.com/us/world-air-quality-ranking"))

doc.css("tr").each do |table_row| 
  country_name = table_row.css(".link-primary").text
  year = 2023
  ghg_amount = table_row.css(".aqi-number").text

  Country.create(name: country_name, year: year, ghg_amount: ghg_amount)
end


# category samples
categories = [
  Category.create(name: 'Water Pollution'),
  Category.create(name: 'Air Pollution'),
  Category.create(name: 'Earth Pollution'),
  Category.create(name: 'Fire Pollution')
]

#user samples
users = []
  5.times do 
    users << User.create(
      username: Faker::TvShows::BigBangTheory.character,
      email: Faker::Internet.email,
      password:"password"
    )
  end 

15.times do 
  activity = Activity.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    image_path: "https://img.freepik.com/free-photo/whitelipped-tree-frog-litoria-infrafrenata-green-leaves_488145-3188.jpg?w=1060&t=st=1678148899~exp=1678149499~hmac=7187e2fb0dee3cfc9828073fca5dc2e66859266ff6fe76801299a2df8dc23da7",
    user: users.sample
  )

  activity.categories << categories.sample(2)
end




