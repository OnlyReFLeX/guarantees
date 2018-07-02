source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# auth
gem 'devise', '~> 4.4', '>= 4.4.3'

# localize
gem 'rails-i18n', '~> 5.1', '>= 5.1.1'

# jquery
gem 'jquery-rails', '~> 4.3'
gem 'jquery-ui-rails', '~> 6.0'

# icons
gem 'material_icons'

# pagination
gem 'will_paginate', '~> 3.1.0'

# slim
gem 'slim-rails', '~> 3.1'

gem 'keynote', '~> 1.1'
gem 'pg_search', '~> 2.1'
