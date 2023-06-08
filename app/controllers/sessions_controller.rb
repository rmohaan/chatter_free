class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :login]

  def new
  end

  def create
    @user =  User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User creation successful"
      redirect_to @user
    else
      flash[:alert] = "User creation failed"
      redirect_to 'new'
    end
  end

  def login
    user = User.where("lower(username) = ?", params[:session][:username].downcase).first()
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "User logged in successfully"
      redirect_to root_path
    else
      flash[:alert] = "User login failed"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're successfully logged out"
    redirect_to login_path
  end

  private
  def user_params
    params.require(:session).permit(:username, :password)
  end

  def logged_in_redirect
    if logged_in?
      flash[:alert] = "#{logged_user.username}, you're already logged in"
      redirect_to root_path
    end
  end

end