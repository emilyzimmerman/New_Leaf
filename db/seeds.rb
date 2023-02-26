require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(URI.open("https://www.iqair.com/us/world-air-quality-ranking"))
ghg = doc.css(".aqi-number").text
country_name = doc.css(".link-primary").text

#Scrape info, get into an array 
 countries = [ 
    {
     name: country_name,
     year: 2023,
     ghg_amount: ghg
    }
 ]

 countries.each do |country| 
   Country.create(name: country[:name], year: country[:year], ghg_amount: country[:ghg_amount])
 end



