class UserController < ApplicationController
  def signin
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard"

    else
      flash.now[:alert] = "Username or password is not correct."
      render :signin

    end
  end

  def signup
    @user = User.new
  end

  def register
    @user = User.new(user_params)
    
    if @user.save 
      flash[:notice] = "Signed up successfully."
      redirect_to "/login"
    else 
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :signup

    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password , :password_confirmation)
  end

end
