class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def load_hosts
    @hosts = Host.all.collect { |host| [ host.name, host.slack_id] }
  end
end
