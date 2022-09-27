source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
# An easy way to keep your users' passwords secure.
gem 'bcrypt', '~> 3.1', '>= 3.1.18'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.23'
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
