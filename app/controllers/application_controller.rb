class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    return unless session[:user_id]
    User.find_by(id: session[:user_id])
  end

  protected

    def registered_only
      redirect_to root_url unless current_user
    end
end
