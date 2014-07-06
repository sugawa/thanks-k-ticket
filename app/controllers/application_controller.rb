class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :basic_authenticate
  def basic_authenticate
    if Rails.env.development? || ENV['BASIC_AUTH'] == "ENABLED"
      authenticate_or_request_with_http_basic('Secret Area') do |urlname, password|
        [urlname, password] == ["kwww2","kannothx123"]
      end
    end
  end
end
