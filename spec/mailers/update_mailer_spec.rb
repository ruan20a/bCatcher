require "spec_helper"

describe UpdateMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @user = User.create({"name" => "amy", "email" => "amy2@gmail.com", "password" => "hahah", "password_confirmation" => "hahah"})
    @item = Item.create({"user_id" => @user.id, "price" => 200.00, "required_price" => 200.00})
    UpdateMailer.update_price(@user, @item).deliver
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to.should == [@user.email]
  end

  it 'should set the subject to the correct subject' do
    ActionMailer::Base.deliveries.first.subject.should == "#{@item.price} now matches your #{@item.required_price}"
  end

  it "renders the sender email" do
    ActionMailer::Base.deliveries.first.from.should == ['pricecatcher1@gmail.com']
  end

end
