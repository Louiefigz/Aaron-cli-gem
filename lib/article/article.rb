
class FunnyArticle::Article

  def initialize

  end 

  def self.select_hash(puts_info)
    @@correct_hash = FunnyArticle::Topics.list[puts_info.to_i - 1]

  end

  def self.find_article(puts_info)
    doc = Nokogiri::HTML(open(@@correct_hash.values[0]))
    article_links = []
    doc.css('.large-thing h2 a').map do |link| 
      article_links << "http://www.theonion.com" + "#{link['href']}"
    end 
  end 

  def return_article(puts_info)
    find_article(puts_info)
    url = article_links[puts_info.to_i - 1]
    new_doc = Nokogiri::HTML(open(url))
    
    array = []
    new_doc.css('.content-media .image') ? array << "Image" : array << "No Image"
    new_doc.css('.content-text').text.strip == '' ? array << "No article provided" : array << new_doc.css('.content-text').text.strip
    
    array.join("\n----------------------------\n")
  end


end