source 'https://rubygems.org'
 
gem 'rails', '4.2.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'twitter-bootstrap-rails'
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms'
 
gem_group :development, :test do
  gem 'pry-rails'
  gem 'spring'
  gem 'quiet_assets'
  gem 'faker'
end
 
gem_group :development do
  gem 'better_errors'
  gem 'did_you_mean'
  gem 'binding_of_caller'
  gem 'sqlite3'
end
 
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

if yes?("Use devise?")
  gem 'devise'
  generate 'devise:install'
  generate 'devise', 'User'
end
 
after_bundle do
  git :init
  git add: "."
  git commit: "-m 'Initial commit'"
 end
