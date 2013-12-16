class UpdateMailer < ActionMailer::Base
  default from: "pricecatcher1@gmail.com"
  def update_price(user, item)
    @user = user
    @item = item
    mail :to => @user.email, :subject => "#{@item.price} now matches your #{@item.required_price}"
  end
end

