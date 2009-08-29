# Load base template
  load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"

# Add Plugins
  plugin 'open_id_authentication', :git => 'git://github.com/rails/open_id_authentication.git', :submodule => true
  plugin 'asset_packager', :git => 'http://synthesis.sbecker.net/pages/asset_packager', :submodule => true
  plugin 'role_requirement', :git => 'git://github.com/timcharper/role_requirement.git', :submodule => true
  plugin 'restful-authentication', :git => 'git://github.com/technoweenie/restful-authentication.git', :submodule => true

#Add openid gem
  gem 'ruby-openid', :lib => 'openid'
  rake("gems:install", :sudo => true)
 
# Initialize restfull auth  
  generate("authenticated", "user session")

#### Add and Commit all changes
  git :add => '.'
  git :commit => "-a -m 'Initial commit -  from http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb'"

# Success
  puts "SUCCESS!"