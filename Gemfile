# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'pg'
gem 'shotgun', '~> 0.9.2'
gem 'sinatra', '~> 2.1'
gem 'webrick', '~> 1.7'

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'rspec', '~> 3.10'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end 
