source 'https://rubygems.org'

group :assets do
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'sass-rails'
  gem 'libv8',                  '~> 3.11.8' unless RUBY_PLATFORM =~ /freebsd/
  gem 'therubyracer',           :platforms => :ruby, :require => 'v8'
  gem 'uglifier'
end

group :default do
  gem 'curb'
  gem 'esp-commons'
  gem 'hashie'
  gem 'jquery-rails'
  gem 'kaminari'
  gem 'openteam-commons'
  gem 'rails'
  gem 'russian'
end

group :production do
  gem 'unicorn'
end

group :developmen do
  gem 'rvm-capistrano'
end
