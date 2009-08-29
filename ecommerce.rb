#load base templates
  load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"
  load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/authentication.rb" if yes? ("User restful-authentication?")
  load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/suthlogic.rb" if yes? ("User authlogic?")

# Add Active merchant
  gem 'activemerchant'
  rake("gems:install", :sudo => true)

#### Add and Commit all changes
  git :add => '.'
  git :commit => "-a -m 'Initial commit -  from http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb'"

# Success
  puts "SUCCESS!"