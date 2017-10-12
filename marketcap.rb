require 'open-uri'
require 'nokogiri'


def get_all_currencies()
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
	
	currencies=[]
	prices=[]
	table=[]

	doc.xpath('//td[@class="no-wrap currency-name"]/a').each do |blabla|
	  puts blabla.text	 
	end

	
	doc.xpath('//a[@class="price"]').each do |node|
	  prices<<node.text	 
	end

	table = currencies.zip(prices).map {|currency,price| {:currency==>currency, :price==>price}}
	puts table	
end


get_all_currencies()