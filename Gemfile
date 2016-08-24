source 'https://rubygems.org'

ruby "2.2.0"
gem 'rails', '4.2.2'
gem 'pg'
gem 'sass-rails', '~> 5.0'   # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'   # Compresses JavaScript assets
gem 'jquery-rails'           # Uses jQuery as the JavaScript library
gem 'turbolinks'             # Turbolinks makes following links in web app faster.  https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'     # Build JSON APIs with ease.  https://github.com/rails/jbuilder
gem 'prawn'                  # PDF generator
gem 'aws-sdk', '~> 2'
gem 'paperclip'              # File attachement library for ActiveRecord
gem 'haml', '~> 4.0.7'
gem 'devise'                 # Authentication
gem 'bootstrap-sass'
gem 'autoprefixer-rails'     # Adds the proper vendor prefixes toCSS code when it is compiled.
gem 'selenium-webdriver', '~> 2.47.1'
gem 'sdoc', '~> 0.4.0', group: :doc  # bundle exec rake doc:rails generates the API under doc/api
gem 'pry-byebug'
gem 'better_errors'
gem 'binding_of_caller'
gem 'font-awesome-rails'
gem 'awesome_print'


group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug'               # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0'# Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'               # Spring speeds up development by keeping your application running in the background. https://github.com/rails/spring
  gem 'rspec-rails'
  gem 'capybara'
end

group :production do
  gem 'rails_12factor'      # Heroku integration has previously relied on using the Rails plugin system, which has been removed from Rails 4. To enable features such as static asset serving and logging on Heroku please add rails_12factor gem to your Gemfile.
end
