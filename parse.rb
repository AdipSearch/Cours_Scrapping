require 'open-uri'
require 'nokogiri'


	

	def get_the_email_of_a_townhal_from_its_webpage(urls, names)
		
		#h=Hash.new("defaut")
		
		emails=[]
		mairies=[]
		urls.each do |url|
		
			doc = Nokogiri::HTML(open(url))
			a=doc.xpath('//p[@class="Style22"]/font[@size="2"]')
			email= a[10].text
			emails<<email
		end
		
		mairies = names.zip(emails).map {|name,email| {:name==>name, :email==>email}}
		puts mairies
		#names.each do |name|
		#	h[name]=email
		#end	
		
		#puts h
	end

		

	def get_all_the_urls_of_val_doise_townhalls ()
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
		urls = []
		names=[]
		doc.xpath('//a[@class="lientxt"]/@href').each do |node|
		  longueur = node.text.length
		  url1 = node.text
		  
		  url2= "http://annuaire-des-mairies.com#{url1[1..longueur-6]}"
		  
			urls<<url2
		end

		doc.xpath('//a[@class="lientxt"]').each do |node|
		  name = node.text
		   names<<name
		end

		get_the_email_of_a_townhal_from_its_webpage(urls, names)
	end

	#def get_all_the_names_of_val_doise_townhalls ()
	#	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
	#	names = []
		
	#	doc.xpath('//a[@class="lientxt"]').each do |node|
	#	  name = node.text
	#	   names<<name
	#	end

	#	get_the_email_of_a_townhal_from_its_webpage(urls)

	#end


get_all_the_urls_of_val_doise_townhalls()







#//p[@class = "Style22"]/font[1]
#/html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td[1]/table[4]/tbody/tr[2]/td/table/tbody/tr[4]/td[2]/p/font
#"annuaire-des-mairies.com" +