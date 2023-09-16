source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'rails'
gem 'rails-i18n' # TODO:config/locales/ja.ymlだけでいい
gem 'bcrypt'
gem 'whenever', require: false
gem 'bootstrap_form'
gem 'will_paginate'  # １つに絞るかkaminariに変える
gem 'bootstrap-will_paginate' # １つに絞るかkaminariに変える
gem 'will_paginate-bootstrap4' # １つに絞るかkaminariに変える
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4' # 開発環境もpostgresにする
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'sentry-ruby', '~> 5.10'
gem 'sentry-rails', '~> 5.10'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
  gem 'dockerfile-rails', '>= 1.5'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '1.3.5'
end