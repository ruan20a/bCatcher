module SessionHelper
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
    current_user = User.find(session[:user_id])
  end
end