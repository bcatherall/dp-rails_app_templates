#Setup for windows
def win_env?
  RUBY_PLATFORM=~ /win32/
end

def rake(command, options = {})
  env = options[:env] || 'development'
  log 'rake', "#{command} in #{env} environment "
  sudo = win_env?  ? '' : (options[:sudo] ? 'sudo' : '')
  rake_cmd = win_env? ? "rake.bat" : 'rake'
  in_root { run("#{sudo} #{rake_cmd} #{command} RAILS_ENV=#{env}", false) }
end

# Delete unnecessary files
  run ("rm README")
  run ("rm public/index.html")
  run ("rm public/favicon.ico")
  run ("rm public/robots.txt")
  run ("rm -f public/javascripts/*")
 
# Download JQuery
  run ("curl -L http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js > public/javascripts/jquery.js")
  run ("curl -L http://jqueryjs.googlecode.com/svn/trunk/plugins/form/jquery.form.js > public/javascripts/jquery.form.js")


# Set up git repository
  git :init
  git :add => '.'
  
# Copy database.yml for distribution use
  run ("cp config/database.yml config/database.yml.example")

# set up .gitignore
  #run (%{find . -type d -empty | xargs -I xxx touch xxx/.gitignore})
  file '.gitignore', <<-END
.DS_Store
coverage/*
log/*.log
db/*.db
db/*.sqlite3
db/schema.rb
tmp/**/*
doc/api
doc/app
config/database.yml
coverage/*
END

# Install Plugins as sub modules
  plugin 'rspec', :git => 'git://github.com/dchelimsky/rspec.git', :submodule => true
  plugin 'rspec-rails', :git => 'git://github.com/dchelimsky/rspec-rails.git', :submodule => true
  plugin 'exception_notifier', :git => 'git://github.com/rails/exception_notification.git', :submodule => true
  plugin 'acts_as_list', :git => 'git://github.com/rails/acts_as_list.git', :submodule => true
  plugin 'blueprint-css', :git => 'git://github.com/joshuaclayton/blueprint-css.git', :submodule => true
  plugin 'acts_as_tree', :git => 'git://github.com/rails/acts_as_tree.git', :submodule => true
  plugin 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git', :submodule => true
  
# Initialize submodules
git :submodule => "init"

#Install Gems
  gem 'thoughtbot-factory_girl', :lib => 'factory_girl'
  gem 'thoughtbot-shoulda', :lib => 'shoulda'
  #gem 'nifty-generators' :lib => 'nifty-generators'
  gem 'mislav-will_paginate', :lib => 'will_paginate'
  gem 'rubyist-aasm', :lib => 'aasm'
  gem 'mysql' 
  gem 'sqlite3-ruby', :lib => 'sqlite3'
  gem 'json'
  gem 'mole'
  gem 'annotate'
  gem 'haml'
  gem 'cucumber'
  gem 'spork'
  gem 'webrat'
  gem 'cldwalker-hirb', :lib => 'hirb'

#Something's up with this on Windows  
rake ("gems:install")
 
# Initialize RSpec  
  generate(:rspec)
  
# Initialize Paperclip
  #generate (:paperclip, "product photo")
  #rake ("db:migrate")
  
# Initialized Cucumber
  #run("spork --bootstrap")
  #generate(:cucumber, "--spork")
  
# Add Initializers
  initializer 'dp-init.rb', <<-CODE
class Object
  def not_nil?
    !nil?
  end
  
  def not_blank?
    !blank?
  end
end
  CODE

#initialize Sessions
  rake ('db:sessions:create')
  rake ('db:migrate')  

#### Add and Commit all changes
  git :add => '.'
  git :commit => "-m 'Initial commit -  from http://github.com/bcatherall/dp-rails_app_templates/raw/master/base.rb'"

# Success
  puts "SUCCESS!"