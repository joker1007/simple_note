ruby "2.1.0"

source 'https://rubygems.org'
source 'https://rails-assets.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.rc1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'pg' # for heroku
gem 'rails_12factor', group: :production # for heroku

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'compass-rails'
gem 'zurui-sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'haml-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby, group: :production

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',          group: :doc, require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/jonleighton/spring
gem 'spring',        group: :development
gem "spring-commands-rspec", group: :development
gem "spring-commands-cucumber", group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'pry-rails'
gem 'awesome_print'
gem 'tapp'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'pry-byebug'
  gem "pry-stack_explorer"

  gem "teaspoon"
end

group :development do
  gem 'coffee-rails-source-maps'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'fuubar'
  gem 'capybara'
  gem 'poltergeist'
end

# rails-assets
gem 'rails-assets-bootstrap-sass'
gem 'rails-assets-lodash'
gem 'rails-assets-backbone'
gem 'rails-assets-backbone.stickit'
gem 'rails-assets-chai'
gem 'rails-assets-chai-jquery'
gem 'rails-assets-sinonjs'

gem 'handlebars_assets'

gem 'redcarpet'
