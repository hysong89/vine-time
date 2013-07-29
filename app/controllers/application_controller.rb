class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain

  APP_DOMAIN = 'www.vynetime.com'

  def ensure_domain
    if request.env['HTTP_HOST'] != APP_DOMAIN && ENV["RAILS_ENV"] != 'development' && ENV["RAILS_ENV"] != 'test'
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
end
