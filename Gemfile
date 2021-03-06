# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Custom
  gem 'faker', '~> 2.13'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Custom
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 0.88.0'
  gem 'rubocop-rails', '~> 2.6'
end

group :test do
  # Custom
  gem 'shoulda-matchers', '~> 4.3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Custom
gem 'active_model_serializers', '~> 0.10.10'
