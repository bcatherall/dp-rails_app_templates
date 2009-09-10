# Add Plugins
  plugin 'open_id_authentication', :git => 'git://github.com/rails/open_id_authentication.git', :submodule => true
  plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git', :submodule => true
  plugin 'role_requirement', :git => 'git://github.com/timcharper/role_requirement.git', :submodule => true
  plugin 'restful-authentication', :git => 'git://github.com/technoweenie/restful-authentication.git', :submodule => true

# Initialize submodules
  git :submodule => "init"

#Add openid gem
  gem 'ruby-openid', :lib => 'openid'
  rake("gems:install", :sudo => true)
 
# Initialize restfull auth  
  generate("authenticated", "user session")

