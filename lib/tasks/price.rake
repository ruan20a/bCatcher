#environment needs to be loaded
namespace :price do
  desc "Checks the prices!"
  task :check => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'mechanize'

    items = Item.all

    items.each do |item|
      url = item.source_url
      unless url.nil?
        doc = Nokogiri::HTML(open(url))
        before_price = item.price
        before__price = item.current_price
        size = item.size
        color = item.color

        current_price = doc.at_css("span[itemprop=price]").text[/[0-9\.]+/]
        puts ("#{item.title} - #{current_price}")
        item.update_attribute(:current_price, current_price)
        item.compare_price
      end
    end

  end
end
