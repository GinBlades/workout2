class ApplicationController < ActionController::Base
  def tmp_no_edit
    redirect_to root_url
  end

  helper_method :current_user
  def current_user
    return unless session[:user_id]
    User.find_by(id: session[:user_id])
  end
end
