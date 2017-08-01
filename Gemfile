source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# fonts and other important CSS
gem 'font-awesome-sass', '~> 4.7.0'
gem 'normalize-rails', '~> 4.1.1'
gem 'modernizr-rails', '~> 2.7.1'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'recaptcha', '~> 4.3.1'
gem 'simple_form', '~> 3.5.0'
gem 'country_select', '~> 3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Redis for Active Job Scheduler
gem 'redis', '~> 3.3.3'
# Login and security
gem 'devise', '~> 4.3.0'

# Add scoped controller requests, used for Job_Post and Certification filterin on index
gem 'has_scope', '~> 0.7.1'
# Getting over ranges in forms
gem 'enum_help', '~> 0.0.17'

# Let users login using Agility Roots Google Account only
gem 'omniauth', '~> 1.6.1'
gem 'omniauth-google-oauth2', '~> 0.5.0'

# Use Cancancan for Authorization
gem 'cancancan', '~> 2.0'
# roles with devise and cancancan
gem 'rolify', '~> 5.1'

# keeping captcha simple
gem 'rest-client', '~> 2.0.2'

# Use background jobs for mailer and notifications
gem 'resque', '~> 1.27.4'
gem 'resque-scheduler', '~> 4.3.0'

# Use tinymce editor
gem 'tinymce-rails', '~> 4.6.2'
# publish sitemap
gem 'sitemap_generator', '~> 5.3.1'

#Allow social publish when certifications , meetups, trainings are created
gem 'twitter', '~> 6.1'
gem 'koala', '~> 3.0'
gem 'linkedin', '~> 1.1'
# Upload banner assets to AWS S3
gem 'paperclip', '~> 5.1'

# generate friendly slug for website
gem 'friendly_id', '~> 5.2.1'

# generate PDFs for download
gem 'wicked_pdf', '~> 1.1'
gem 'wkhtmltopdf-binary', '~> 0.12.3.1'

# audit log all actions
gem 'paper_trail', '~> 7.0.3'

group :production do
  gem 'resque-pool', '~> 0.6.0'
  gem 'god', '~> 0.13.7'
end

# manage all environment properties through ENV macro
gem 'figaro', '~> 1.1.1'

# Validate date range for certifications
gem 'validates_timeliness', '~> 4.0.2'

# Nothing ever dies!! Do not allow deletion of records
gem 'paranoia', '~> 2.3.1' 

#better display date ranges 
gem 'time_will_tell', '~> 0.1.0'

# format money
gem 'money', '~> 6.9'

# make concurrency easy
# gem 'wisper-celluloid', '~> 0.0.1'

# Backup Database
# gem 'backup', '~> 4.4'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-social', '~> 5.1.1'
  gem 'rails-assets-bootstrap-sweetalert', '~> 1.0.1'
  gem 'rails-assets-lodash', '~> 4.17.4'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
	gem 'meta_request'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6'
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'pry-byebug'
  gem 'rails_layout'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'cucumber-rails', '~> 1.5', :require => false
  gem 'page-object', '~> 2.1.1'
  gem 'watir', '~> 6.3'
  gem 'database_cleaner', '~> 1.6.1'
  # Fixtures are messy!
  gem 'factory_girl_rails', '~> 4.8'
  gem 'ffaker', '~> 2.6'
  gem 'json-schema', '~> 2.8'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
