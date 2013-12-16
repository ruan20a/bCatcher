class SessionController < ApplicationController

  def new
  end

  def create
    email = params[:email].downcase
    password = params[:password]
    user = User.where(email: email).first
    if user && user.authenticate(password)
      respond_to do |format|
        format.html do
          session[:user_id] = user.id
          redirect_to user
        end
        format.json { render json: user.id }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Invalid email/password combination"
          render :new
        end
        format.json{render json: "Invalid email/password combination", status: :unprocessable_entity}
      end
      #TODO validation fixed but json looks funky. need to test!
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to (login_path)
  end
end

private
  def user
    User.where(email: params[:email]).first
  end
