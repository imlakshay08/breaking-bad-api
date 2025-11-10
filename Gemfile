source "https://rubygems.org"

ruby "3.2.3"

# Rails
gem "rails", "~> 7.1.0"

# Database
gem "sqlite3", "~> 1.4"

# Server
gem "puma", ">= 5.0"

# JSON API
gem "jbuilder"

# CORS
gem "rack-cors"

# Pagination
gem "kaminari"

# Documentation
gem "rswag"
gem "rswag-api"
gem "rswag-ui"

# Build JSON APIs with ease
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[mri windows]
  
  # Testing
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "rswag-specs"
end

group :test do
  gem "database_cleaner-active_record"
  gem "shoulda-matchers", "~> 5.0"
end
