load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"
load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/authentication.rb"
gem 'activemerchant'

rake("gems:install", :sudo => true)


