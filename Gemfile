# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# https://github.com/lucascaton/enumerate_it
gem 'enumerate_it', '~> 3.2', '>= 3.2.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # https://github.com/rweng/pry-rails#usage
  gem 'pry-rails', '~> 0.3.9'
  # https://github.com/faker-ruby/faker
  gem 'faker', '~> 3.2.0'
  # https://rubygems.org/gems/rubocop-rails
  gem 'rubocop-rails', '~> 2.16', '>= 2.16.1'
  # https://rubygems.org/gems/rubocop-performance
  gem 'rubocop-performance', '~> 1.15'
  # https://rubygems.org/gems/rubocop-rspec
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2'
end

group :test do
  # https://github.com/rspec/rspec-rails#installation
  gem 'rspec-rails', '~> 6.0'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 5.2'
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  # https://github.com/bblimke/webmock#examples
  gem 'webmock', '~> 3.18', '>= 3.18.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
