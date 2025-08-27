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

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
