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

  def dashboard
    @link = Link.new

    if session[:user_id]
      @user = User.find(session[:user_id])
      @username = @user.username
    end

  end

  def logout
    session[:user_id] = nil

    redirect_to root_path
  end

  def delete_account
    @user = User.find(session[:user_id])

    if !@user 
      redirect_to root_path
    end

    @user.destroy 

    redirect_to root_path
  end

  def changepassword
  end

  def change_password
    @user = User.find(session[:user_id])

    if @user.authenticate(params[:current_password])

      if params[:new_password] != params[:password_confirmation]
        flash[:alert] = "Passwords don't match"
        render :changepassword
        return
      end

      @user.password = params[:new_password]

      if @user.save
        session[:user_id] = nil 
        flash[:notice] = "Password changed successfully."
        redirect_to "/login"
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        render :changepassword
      end

    else 
      flash[:alert] = "Current password is not correct."
      render :changepassword

    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password , :password_confirmation)
  end

end
