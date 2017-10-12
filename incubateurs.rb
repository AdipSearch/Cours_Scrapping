require 'open-uri'
require 'nokogiri'

def get_incubateurs()

	names=[]
	codes=[]

	doc = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs/incubateurs-startups/?tevolution_sortby=alphabetical"))
	doc.xpath('//h2/a').each do |name|
	  #puts name.text
	  	 
	end

	doc.xpath('//p[@class="address"]').each do |address|
	  adresse=address.text
	  puts adresse
	  adresse2= adresse.partition(" ")
	  puts adresse2[3]

	end

end

get_incubateurs()