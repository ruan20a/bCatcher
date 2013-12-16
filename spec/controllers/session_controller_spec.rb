require 'spec_helper'

describe SessionController do
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @user = User.create({"name" => "amy", "email" => "amy2@gmail.com", "password" => "hahah", "password_confirmation" => "hahah"})
      @good_signin = {:email => "amy2@gmail.com", :password => "hahah"}
      @bad_signin = {:email => "amy@gmail.com", :password => "invalid"}
    end

    describe 'invalid signin' do
      it "should re-render the new page" do
        post :create, @bad_signin
        response.should render_template('new')
      end

      it "should have a flash.now message" do
        post :create, @bad_signin
        flash.now[:error].should eq("Invalid email/password combination")
      end
    end

    describe 'valid signin' do
      it "should redirect the user page" do
        post :create, @good_signin
        response.should redirect_to(user_path(@user))
      end

      it "should sign the user in" do
        post :create, @good_signin
        controller.current_user.should == @user
        controller.should be_signed_in
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @user = User.create({"name" => "amy", "email" => "amy2@gmail.com", "password" => "hahah", "password_confirmation" => "hahah"})
      @good_signin = {:email => "amy2@gmail.com", :password => "hahah"}
    end

    it "should sign a user out" do
      post :create, @good_signin
      delete :destroy
      controller.should_not be_signed_in
    end

    it "should redirect to root_path" do
      post :create, @good_signin
      delete :destroy
      response.should redirect_to(login_path)
    end

  end
end