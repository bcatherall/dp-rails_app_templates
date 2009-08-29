# Load base template
  load_template "http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"

#Install Gems
  gem 'authlogic-oid', :lib => 'authlogic_openid'
  gem 'ruby-openid', :lib => 'openid'
  gem 'authlogic'
  rake("gems:install", :sudo => true)

#Initialize user and session scaffolds
  generate(:nifty_scaffold, "user username:string email:string password:string new edit")
  rake ("db:migrate")
  generate(:session, "user_session")
  generate(:nifty_scaffold, "user_session --skip-model username:string password:string new destroy")

#Add open id
  plugin "open_id_authentication", :git => "git://github.com/rails/open_id_authentication.git", :submodule => true

#Initialize open id  
  rake("open_id_authentication:db:create")
  generate(:migration, "add_openid_identifier_to_users openid_identifier:string")
  rake("db:migrate")

#Add Routes
  route 'map.login "login", :controller => "user_sessions", :action => "new"' 
  route 'map.logout "logout", :controller => "user_sessions", :action => "destroy"'
  route 'map.resources :user_sessions'
  route 'map.resources :users'
  route 'map.resources :articles'
  route 'map.resources :comments'
  route 'map.root :articles'

#### Add and Commit all changes
  git :add => '.'
  git :commit => '-m "Initial commit -  from http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb"'

# Success
  puts "SUCCESS!"