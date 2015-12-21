require 'pry'

class FunnyArticle::Topics 
  attr_accessor :descriptions, :category, :headlines
  
  @@list = [
    {"politics" => 'http://www.theonion.com/section/politics/'},
    {"sports" => 'http://www.theonion.com/section/sports/'}, 
    {"local"=> 'http://www.theonion.com/section/local/'}, 
    {"business" => 'http://www.theonion.com/section/business'}, 
    {"entertainment" => 'http://www.theonion.com/section/entertainment/'}, 
    {"science technology" => 'http://www.theonion.com/section/science-technology/'}, 
    {"after birth" => 'http://www.theonion.com/section/after-birth'}]


  def initialize
  end 

  def self.list
    @@list
  end

  
  

  def end_now
    puts "GoodBye!!!" 
    exit
  end 

public
  def self.scrape_details
  @@articles = []
  doc = Nokogiri::HTML(open(@@correct_hash.values[0]))
    scrape = doc.css('.large-thing')
    scrape.css('.inner').each do |div|
      @@article = {}
      header = div.css("h2").text.strip
      description = div.css('.desc').text.strip
      if description == ""
        description = "no description provided"
      end
      @@article["header"] = header
      @@article["description"] = description
      @@articles << @@article
    end
    @@articles
  end
end 
