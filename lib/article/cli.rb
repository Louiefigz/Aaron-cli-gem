require 'pry'

module FunnyArticle
end 

class FunnyArticle::CLI

  def list 
    puts ""
    puts "************* Current topics *************" 
    print_all_topics
    puts ""
  end 

  public
  def begin_now
    list
    index = nil 
    while index != 'exit' || Integer
      puts "Which Topic would you like to read more on? Choose a number please: "
      puts ""
      puts "Enter 'exit' to quit."
      puts ""
      
      intake(gets.strip)
      FunnyArticle::Article.scrape_details.each.with_index do |heck_yea, i|
        puts "#{i+1}: #{heck_yea['header']}"
        puts ""
        puts "Description: #{heck_yea['description']}"
        puts "---------------------------"
      end
      puts ""
      puts "Which article would you like to read? Choose a number please: "
      puts ""
      puts "Enter 'exit' to quit."
      puts ""
      puts "#{intake_article(gets.strip)}"
      puts "**************************"
      puts ""
      restart
      exit
    end
  end 

    def print_all_topics
    FunnyArticle::Topics.list.each.with_index do |topic,index|
      puts "#{index+1}: #{topic.keys[0]}"
    end
  end

  def intake_article(puts_info)
      if puts_info == 'exit'
      puts "Goodbye!!!!!"
      exit
    elsif puts_info.to_i > FunnyArticle::Article.scrape_details.count
      puts ""
      puts "/////////////////Please select a number from the list above//////////////"
      FunnyArticle::CLI.new.begin_now
    end 
      FunnyArticle::Article.return_article(puts_info)
  end 

  def intake(puts_info)
    if puts_info == 'exit'
      puts 'GoodBye!!!!'
      exit
    elsif puts_info.to_i > FunnyArticle::Topics.list.count
      puts ""
      puts "///////////Please select a number from the list above//////////////"
      FunnyArticle::CLI.new.begin_now
    end 
    # binding.pry
      FunnyArticle::Article.select_hash(puts_info)
  end

  def restart
    puts "Would you like to restart? Enter y/n"
    if gets.strip == "y"
      begin_now
    else
      puts "GoodBye!!!!"
    end 
  end
end
 