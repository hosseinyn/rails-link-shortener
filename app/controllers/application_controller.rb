class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def loged_in
    if session[:user_id]
      @user = User.find(session[:user_id])
    end

    @user.present?
  end

  def require_login
    unless loged_in
      flash[:alert] = "Login required."
      redirect_to "/login"
    end
  end
  

  def require_not_login
    if loged_in
      redirect_to "/dashboard"
    end
  end

end
