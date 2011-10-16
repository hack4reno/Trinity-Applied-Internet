class Authorization < ActiveRecord::Base
  include Extensions::UUID
  
  belongs_to :user
  
  def update_types
    update_settings.keys
  end

  def update_params
    update_settings
  end

  def update_defaults
    defaults = Hash.new
    update_settings.each do |k,v|
      defaults[k] = Hash.new
      v.each do |k1,v1|
        defaults[k][k1] = v1[:default]
      end
    end
    defaults
  end
  
  def self.requires_setup?
    false
  end
    
  protected
    def update_settings
      {}
    end
end
