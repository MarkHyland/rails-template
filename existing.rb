def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end
  
  gem 'quiet_assets'
  gem 'pry-rails'
  
  gem_group :development do
    gem 'better_errors'
    gem 'did_you_mean'
    gem 'binding_of_caller'
  end
  
  # Move sqlite3 to development
  comment_lines "Gemfile", /sqlite/
  gem_group :development do
    gem 'sqlite3'
  end
  gem_group :production do
    gem 'pg'
    gem 'rails_12factor'
  end
  
  comment_lines "Gemfile", /byebug/
  comment_lines "Gemfile", /web-console/
  
  require 'pry'
  binding.pry
  
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
