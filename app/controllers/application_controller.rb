class ApplicationController < ActionController::Base

  def tmp_no_edit
    redirect_to root_url
  end
end
