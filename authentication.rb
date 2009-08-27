load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"

plugin 'open_id_authentication', 
  :git => 'git://github.com/rails/open_id_authentication.git'
plugin 'asset_packager', 
  :git => 'http://synthesis.sbecker.net/pages/asset_packager'
plugin 'role_requirement', 
  :git => 'git://github.com/timcharper/role_requirement.git'
plugin 'restful-authentication', 
  :git => 'git://github.com/technoweenie/restful-authentication.git'


gem 'ruby-openid'


rake("gems:install", :sudo => true)
 
generate("authenticated", "user session")
