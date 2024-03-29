source 'http://ruby.taobao.org'

gem 'rails', '3.2.3'

# App dependent gems
gem 'carrierwave', '0.5.8'
gem 'decent_exposure', '~> 1.0.1' # A helper for creating declarative interfaces in controllers
gem 'devise', '~> 2.0.4'
gem 'escape_utils' # Faster string escaping routines, escaped_html = EscapeUtils.escape_html(html)
gem 'formtastic', '1.2.3'
gem 'gravatar_image_tag', '1.0.0'
gem 'haml', '~> 3.1.4'
gem 'jquery-rails'
gem 'therubyracer'
gem 'nokogiri', '~> 1.5.0'
gem 'rdiscount', '1.6.8'
gem 'responders', '~> 0.6.4'
gem 'state_machine', '1.1.2'
gem 'whenever', require: false

# Optional Gems
# pg gem for PostgreSQL Database
gem 'pg', '0.11.0'
# Unicorns FTW
gem 'unicorn'
# Whiskey Disk for deployment
gem 'whiskey_disk', '0.6.24' # Whiskey Disk: embarrassingly fast deployments. Then make a deploy.yml file

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

# Optional, for error capture on production
group :production, :staging do
  gem 'hoptoad_notifier' # depracated, please use airbrake When an uncaught exception occurs, Airbrake will POST the relevant data to the Airbrake server specified in your environment.
end

group :development, :test do
  gem 'fabrication', '~> 1.2.0'
  gem 'haml-rails', '0.3.4'
  gem 'pry'
  gem 'rspec-rails', '~> 2.8.0'

  gem 'letter_opener'
  gem 'simplecov'
end

group :test do
  gem 'capybara', '~> 1.1.2'
  gem 'database_cleaner'
  gem 'email_spec', '~> 1.2.1'
  gem 'fivemat' # MiniTest/RSpec/Cucumber formatter that gives each test file its own line of dots
  gem 'launchy'
  gem 'shoulda-matchers', '1.0.0'
  gem 'turnip', '~> 0.3.0' # Gherkin extension for RSpec 
  gem 'webmock', '~> 1.8.0'
end

gem 'inherited_resources'
# gem 'client_side_validations'
