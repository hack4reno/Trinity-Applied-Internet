class Services::FacebookAuthorization < Authorization
  
  def user_id
    account_info.id
  end

  def last_update
    id = user_id
    home_info.data.data.each do |post|
      return post.message if post.from.id == id and not post.message.blank? #and post.type == 'status'
    end
    ""
  rescue
    ""
  end

  def account_name
    account_info.name
  end
  
  def account_url
    account_info.link
  end

  def update( params, type = :status_update ) 
    if type == :status_update
      service_client.selection.me.feed.publish!( update_defaults[type].merge(params) )
    elsif type == :link
      service_client.selection.me.links.publish!( update_defaults[type].merge(params) )
    end
  end
  
  def authorize_url( callback_url ) 
    url = service_client.authorization.authorize_url(
      :redirect_uri => callback_url,
      :client_id => Settings.facebook.app_id,
      :scope => 'email,read_stream,create_event,offline_access,publish_checkins,publish_stream,publish_actions,manage_pages,user_status'
      )
    
    { :url => url, :token => nil, :secret => nil }
  end
  
  # token comes back in params[:oauth_verifier]
  def authorize( account, token, secret, params = {} ) 
    access_token = service_client.authorization.process_callback(
      params[:code], 
      :redirect_uri => params[:redirect_uri])

    unless access_token.blank?
      self.account = account
      self.secret = access_token
      self.service_name = self.class.default_service_name
      self.app_id = Settings.facebook.app_id
      self.app_secret = Settings.facebook.app_secret
      self.service_id = self.class.default_service_id
      self.service_url = "https://graph.facebook.com"
      self.save!
      true
    else
      false
    end
  end
  
  def self.default_service_id
    'facebook'
  end

  def self.default_service_name
    'Facebook'
  end

  protected
    def home_info
      @home_info ||= service_client.selection.me.feed.info!
    rescue
      "***Request Failed***"
    end
  
    def account_info
      @info ||= service_client.selection.me.info!
    rescue
      "***Request Failed***"
    end
  
    def service_client
      @client ||= FBGraph::Client.new(
        :client_id => self.app_id || Settings.facebook.app_id, 
        :secret_id => self.app_secret || Settings.facebook.app_secret, 
        :token => self.secret || nil
      )
    end
    
    def update_settings
      Settings.facebook.updates.to_hash
    end
    

end
