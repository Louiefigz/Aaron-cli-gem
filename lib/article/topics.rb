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


  def initialize(description, headline)
    hash[headline]= description
    @descriptions = []
    # @headlines = []
    article
  end 

  def self.print_all_topics
    @@list.each.with_index do |topic,index|
      puts "#{index+1}: #{topic.keys[0]}"
    end
  end

  def self.all_hash
    # binding.pry
    scrape_details
    # @@collection 
    @@articles 
  end 

  def self.intake(puts_info)
    if puts_info == 'exit'
      end_now
    end
    @@correct_hash = @@list[puts_info.to_i - 1]
  end

  def self.intake_article(puts_info)
    if puts_info == 'exit'
      end_now
    else 
    doc = Nokogiri::HTML(open(@@correct_hash.values[0]))
    article_links = []
    doc.css('.large-thing h2 a').map do |link| 
      article_links << "http://www.theonion.com" + "#{link['href']}"
    end 
    url = article_links[puts_info.to_i - 1]
    new_doc = Nokogiri::HTML(open(url))
    
    new_doc.css('.content-text p').text
    end 
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
      header = div.css("h2")
      description = div.css('.desc')
      @@article["header"] = header.text.strip
      @@article["description"] = description.text.strip
      @@articles << @@article
      @@articles
      # binding.pry
    end
  end 

end 
