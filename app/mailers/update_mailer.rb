class UpdateMailer < ActionMailer::Base
  default from: "Catcher <pricecatcher1@gmail.com>"
  def update_price(user, item)
    @user = user
    @item = item
    @url = @item.source_url
    mail :to => @user.email, :subject => "#{@item.title} meets your price requirements!"
  end
end

