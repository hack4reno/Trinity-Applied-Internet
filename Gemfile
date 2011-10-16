source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rails_config'
gem 'jquery-rails', '>= 1.0.12'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
	gem 'therubyracer'
end

gem 'thin'
gem 'bartt-ssl_requirement', :require => 'ssl_requirement'

gem 'postmark-rails'
gem 'devise', :git => 'git://github.com/plataformatec/devise' 
gem 'cancan'
gem 'omniauth', ">=0.2.6"
gem 'oa-openid', :require => 'omniauth/openid'

gem 'twitter_oauth'
gem 'fbgraph', :git => 'git://github.com/pwnall/fbgraph.git'
gem 'icalendar'
gem 'uuidtools'
gem 'foreman'
gem 'delayed_job'
gem 'exception_notification_rails3', :require => 'exception_notifier'
gem 'gmaps4rails'
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
