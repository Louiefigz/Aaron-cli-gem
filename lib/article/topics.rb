require 'pry'

class FunnyArticle::Topics 
  
  @@list = [
    {"politics" => 'http://www.theonion.com/section/politics/'},
    {"sports" => 'http://www.theonion.com/section/sports/'}, 
    {"local"=> 'http://www.theonion.com/section/local/'}, 
    {"business" => 'http://www.theonion.com/section/business'}, 
    {"entertainment" => 'http://www.theonion.com/section/entertainment/'}, 
    {"science technology" => 'http://www.theonion.com/section/science-technology/'}, 
    {"after birth" => 'http://www.theonion.com/section/after-birth'}]

  def self.list
    @@list
  end

end 
