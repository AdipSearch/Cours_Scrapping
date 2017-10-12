#! /usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
def crypto_currency
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    
    doc.xpath('.//*[@class="odd"]').each do |rows|
        details = rows.collect do |row|
            detail = {}
            [
                [:name, 'td[2]/a/text()'],
                [:symbol, 'td[3]/text()'],
                [:marketcap, 'td[4]/text()'],
                [:price, 'td[5]/a/text()'],
                [:circulatingsupply, 'td[6]/a/text()'],
                [:volume, 'td[7]/a/text()'],
                [:onehour, 'td[8]/a/text()'],
                [:lastday, 'td[9]/text()'],
                [:sevendays, 'td[10]/text()'],
            ].each do |name, xpath|
                detail[name] = row.at_xpath(xpath).to_s.strip
            end
        detail
        end
    p details
    end
end
crypto_currency()
