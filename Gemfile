source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "jbuilder"
gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'faker', require: true
gem 'haml-rails', '~> 2.0.1'
gem "sassc-rails"
gem 'bootstrap'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-rails'
end

group :development do
  gem "web-console"
end


gem "concurrent-ruby", "= 1.3.4"
gem "sidekiq"
gem "devise"
gem "dotenv", "~> 3.1"
