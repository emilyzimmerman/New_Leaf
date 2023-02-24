require 'nokogiri'
require 'open-uri'
require 'pry'

#Scrape info, get into an array 
#  countries = [ 
#     {
#        

#     }
#  ]

doc = Nokogiri::HTML(URI.open("https://www.iqair.com/us/world-air-quality-ranking"))
aqi= doc.css(".aqi-number")[0].text.gsub(/[\s,]/, "").to_i
binding.pry

#  countries.each do |country| 
#     Country.create(country_name: country[:country_name], year: country{:year}, ghg_amount: country[:ghg_amount])
#  end

binding.pry 