source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.0.0'
gem 'rails', '3.2.14'
gem 'activerecord-reputation-system', require: 'reputation_system'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
#gem 'kaminari'
#gem 'kaminari-bootstrap'
gem 'will_paginate'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
# gem 'better_errors'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]
gem 'carrierwave'
gem 'rmagick', '~> 2.13.1'
gem 'sorcery'
gem 'cancan'
# gem 'strong_parameters'

group :development do
	gem 'rspec-rails'#, '~> 2.0' # using rspec instead of test unit
  gem 'better_errors' # makes the errors we see in the browser more descriptive
  gem "binding_of_caller"
  gem 'pry-rails'	
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'uglifier', '>= 1.0.3'
end

group :test do 
  gem 'rspec-rails'#, '~> 2.0' # using rspec instead of test unit
  gem "factory_girl_rails" 
  gem "capybara" # needed for our integration tests, which we'll talk about more later
end