class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  append_before_filter :current_account

  def current_account
    unless current_user.nil?
      @current_account = current_user.account
      PgTools.set_search_path @current_account.id
    else
      PgTools.restore_default_search_path
    end
  end

end
