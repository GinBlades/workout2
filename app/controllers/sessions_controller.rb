class SessionsController < ApplicationController
  before_action :load_session_helper

  def login
    res = @session_helper.request_to_identity_server(root_url, "login")
    if res[:error]
      render json: { error: res[:error] }
    else
      redirect_to res[:success]
    end
  end

  def receive_login
    @token = params[:token]
    username_hash = @session_helper.username_hash(@token)
    @user = User.find_by(username_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    elsif User.approved_users.include?(username_hash["username"])
      @user = User.new(username_hash)
    else
      flash[:alert] = "Registration for this app is not currently available."
      redirect_to root_url
    end
  end

  def save_login
    @token = params[:token]
    @user = User.new(user_params.merge(@session_helper.username_hash(@token)))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :receive_login
    end
  end

  def register
    res = @session_helper.request_to_identity_server(root_url, "register")
    if res[:error]
      render json: { error: res[:error] }
    else
      redirect_to res[:success]
    end
  end

  def logout
    session.clear
    redirect_to root_url
  end

  private

    def load_session_helper
      @session_helper = RiskLoader.instance.session_helper
    end

    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name)
    end
end
