class Services::TwitterAuthorization < Authorization
  
  def user_id
    account_info['id_str']
  end

  def last_update
    account_info['status']['text']
  rescue
    ""
  end

  def account_name
    account_info['screen_name']
  end
  
  def account_url
    Settings.twitter.account_url + account_info['screen_name']
  end

  def update( params, type = :status_update ) 
    if type == :status_update
      service_client.update( params[:message] )
    end
  end
  
  def authorize_url( callback_url ) 
    request_token = service_client.request_token(:oauth_callback => callback_url)
    { :url => request_token.authorize_url, :token => request_token.token, :secret => request_token.secret }
  end
  
  # token comes back in params[:oauth_verifier]
  def authorize( account, token, secret, params = {} ) 
    return false if params[:oauth_token] != token

    access_token = service_client.authorize(
      token,
      secret,
      :oauth_verifier => params[:oauth_verifier]
    )

    if service_client.authorized?
      self.account = account
      self.key = access_token.token
      self.secret = access_token.secret
      self.service_name = self.class.default_service_name
      self.service_id = self.class.default_service_id
      self.service_url = "http://api.twitter.com"
      self.app_id = Settings.twitter.consumer_key
      self.app_secret = Settings.twitter.consumer_secret
      self.save!
      true
    else
      false
    end
  end
  
  def self.default_service_id
    'twitter'
  end

  def self.default_service_name
    'Twitter'
  end

  protected
    def account_info
      @info ||= service_client.info
    rescue
      "***Request Failed***"
    end
  
    def service_client
      @client ||= TwitterOAuth::Client.new(
        :consumer_key => self.app_id || Settings.twitter.consumer_key,
        :consumer_secret => self.app_secret || Settings.twitter.consumer_secret,
        :token => self.key || nil,
        :secret => self.secret || nil
        )
    end

    def update_settings
      Settings.twitter.updates.to_hash
    end

end
