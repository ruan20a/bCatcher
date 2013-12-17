class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  before_update :store_price

  attr_accessor :old_price

  def store_price
    @old_price = self.current_price_was
  end

  def compare_price
    puts @old_price
    if @old_price != self.current_price
      self.update({"is_change" => true})
      if self.current_price <= self.required_price
        UpdateMailer.update_price(self.user, self).deliver
        puts "email sent"
      end
    end
  end

end
