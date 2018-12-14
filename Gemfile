source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'

# Use Postgresql
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Assets
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'sass-rails'
gem 'uglifier'



# Configuration
gem 'config'
gem 'dotenv-rails', require: 'dotenv/rails-now'

# UI/UX
gem 'rails-i18n', '~> 5.0.0'
# gem 'turbolinks'
gem 'jbuilder'
gem 'meta-tags'
gem 'slim-rails'

# Authentication
gem 'sorcery', github: 'sorcery/sorcery'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Decorator
gem 'active_decorator'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
#amazon
gem 'amazon-ecs'

# Configuration
gem 'config'
gem 'dotenv-rails', require: 'dotenv/rails-now'

group :development, :test do
  # Test
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  # Code analyze
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'coffeelint'
  gem 'reek'
  gem 'rubocop'
  gem "rubocop-rails_config"
  gem 'scss_lint', require: false
  gem 'slim_lint'

  # Debugger
  gem 'better_errors'
  gem 'byebug'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'

  # Print debug
  gem 'awesome_print'
  gem 'tapp'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
