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
      url = item.source_url
      doc = Nokogiri::HTML(open(url))
      status_check = false
      before_price = item.price
      before__price = item.current_price
      size = item.sizes
      color = item.color

      # if (!size.nil?){
      #   current_size = doc.at_css("span[itemprop=price]").text[/[0-9\.]+/]
      #   status_check = true
      # }


      # if (!size.color?){

      # }


      current_price = doc.at_css("span[itemprop=price]").text[/[0-9\.]+/]
      puts ("#{my_item.title} - #{current_price}")
      my_item.update_attribute(:current_price, current_price)
      my_item.compare_price
    end

  end

  task :all => [:update_price, :check_price]

  # def pick(model_class)
  #   model_class.find(:first, :order => 'RAND(')
  # end
end

#rake price:check
#rake price:all