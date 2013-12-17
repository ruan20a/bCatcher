source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'mechanize'

gem 'rails_12factor'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'whenever', :require => false


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# gem "has_secure_password", "~> 0.1.0"

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# gem 'open-uri'

# Use Capistrano for deployment
gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem "rspec-rails"
  gem "guard-rspec"
  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "jasmine"
  gem "pry-rails"
  gem "awesome_print"
  gem 'guard-sass', require: false
  gem 'guard-livereload', require: false
  gem 'rails_layout'
end

group :development do
  gem "annotate"
  gem "quiet_assets"
  gem "binding_of_caller"
  gem "meta_request"
  gem "rails-erd"
  gem "better_errors"
  gem "terminal-notifier-guard"
end

gem "simplecov", require: false, group: :test
gem "haml-rails"