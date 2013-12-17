#environment needs to be loaded
namespace :price do
  desc "Checks the prices!"
  task :check => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'mechanize'

    items = Item.all
    url = nil

    items.each do |item|
      my_item = item
      before_price = my_item.price
      before__price = item.current_price

      url = item.source_url
      doc = Nokogiri::HTML(open(url))
      current_price = doc.at_css("span[itemprop=price]").text[/[0-9\.]+/]
      puts ("#{my_item.title} - #{current_price}")
      my_item.update_attribute(:current_price, current_price)
      my_item.compare_price
    end

  end

  desc "Updates the prices!"
  task :update => :environment do
    puts "Hello World!"
  end

  task :all => [:update_price, :check_price]

  # def pick(model_class)
  #   model_class.find(:first, :order => 'RAND(')
  # end
end

#rake price:check
#rake price:all