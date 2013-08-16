source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
	gem 'rails', '4.0.0'

# DATABASE
	gem 'pg', '~> 0.15.1'

# SERVER
	gem 'unicorn'

# ASSETS - CONFIGURATION
	gem 'sass-rails', '~> 4.0.0'
	gem 'uglifier', '>= 1.3.0'
	gem 'coffee-rails', '~> 4.0.0'
	gem 'haml-rails'

# ASSETS - FEATURES
	gem 'jquery-rails'
	gem 'underscore-rails'
	gem 'turbolinks'
	gem 'jquery-turbolinks'
	gem 'jquery-ui-rails'

# ASSETS - DESIGN
	# gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
 	#                              :github => 'anjlab/bootstrap-rails',
 	#                              :branch => '3.0.0'

	gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'
  gem 'font-awesome-rails', '>=3.2.1.3'

# MAILING LIST
	gem 'gibbon'
	gem 'jquery-validation-rails'

# CONFIG VARIABLES
	gem 'figaro'

# USER MANAGEMENT
	gem 'omniauth-google-oauth2'
	gem 'google-api-client'

# FILE UPLOADS
	gem 'carrierwave'
	gem 'fog'

# PAYMENT PROCESSING
	gem 'stripe'

# DEBUGGER
	gem 'pry-rails'

	group :development do
		gem 'better_errors'
		gem 'binding_of_caller'
	end

# TESTING
	group :development, :test do
		gem 'rspec-rails'
		gem 'guard-rspec'
		gem 'growl'
	end

	group :test do
		gem 'database_cleaner'
		gem 'factory_girl_rails'
		gem 'shoulda-context'
		gem 'shoulda-matchers'
		gem 'capybara'
	end

# DEPLOYMENT
	group :production do
		gem 'rails_12factor'
		# Add below gems and configure for performance tuning
		# gem 'heroku-deflater'
		# gem 'memcachier'
		# gem 'dalli'
end

# MISC
	# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
	gem 'jbuilder', '~> 1.2'

	group :doc do
	  # bundle exec rake doc:rails generates the API under doc/api.
	  gem 'sdoc', require: false
	end

### COMMENETED OUT CONFIGURATION OPTIONS
### ====================================

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
