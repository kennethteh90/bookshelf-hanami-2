# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 2.0'
gem 'hanami-controller', '~> 2.0'
gem 'hanami-router', '~> 2.0'
gem 'hanami-validations', '~> 2.0'

gem 'dry-types', '~> 1.0', '>= 1.6.1'
gem 'pg'
gem 'puma'
gem 'rake'
gem 'rom'
gem 'rom-sql'
gem 'simple-interactors'

group :development, :test do
  gem 'debug', '>= 1.0.0'
  gem 'dotenv'
  gem 'faker'
end

group :cli, :development do
  gem 'hanami-reloader'
end

group :cli, :development, :test do
  gem 'hanami-rspec'
end

group :development do
  gem 'guard-puma', '~> 0.8'
  gem 'rubocop'
end

group :test do
  gem 'rack-test'
end
