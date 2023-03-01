require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://www.iqair.com/us/world-air-quality-ranking"))

doc.css("tr").each do |table_row| 
  country_name = table_row.css(".link-primary").text
  year = 2023
  ghg_amount = table_row.css(".aqi-number").text

  Country.create(name: country_name, year: year, ghg_amount: ghg_amount)
end


#Scrape info, get into an array 





