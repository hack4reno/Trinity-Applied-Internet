class ApplicationController < ActionController::Base
  APP_DOMAIN = 'eventsmashapp.com'
  protect_from_forgery
  
  before_filter :ensure_domain #, :require_basic_auth
  around_filter :set_time_zone
  
  def require_basic_auth
    unless request.local?
      authenticate_or_request_with_http_basic do |username, password|
        username == "trinity" && password == "tr1n1ty@"
      end
    else
      true
    end
  end
  
  def ensure_domain
    if !request.local? and request.env['HTTP_HOST'] != APP_DOMAIN 
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
    
  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = current_user.time_zone if current_user and current_user.respond_to? :time_zone and not current_user.time_zone.blank?
    flash[:notice] = "Please update your time zone information." if current_user and current_user.respond_to? :time_zone and current_user.time_zone.blank?
    yield
  ensure
    Time.zone = old_time_zone
  end

end
