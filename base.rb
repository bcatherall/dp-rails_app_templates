plugin 'rspec', 
  :git => 'git://github.com/dchelimsky/rspec.git'
plugin 'rspec-rails', 
  :git => 'git://github.com/dchelimsky/rspec-rails.git'
plugin 'exception_notifier', 
  :git => 'git://github.com/rails/exception_notification.git'
plugin 'acts_as_list',
  :git => 'git://github.com/rails/acts_as_list.git'
plugin 'attachment_fu',
  :git => 'git://github.com/technoweenie/attachment_fu.git'
plugin 'blueprint-css',
  :git => 'git://github.com/joshuaclayton/blueprint-css.git'
plugin 'acts_as_tree',
  :git => 'git://github.com/rails/acts_as_tree.git'
 
gem 'mislav-will_paginate'
gem 'rubyist-aasm'
gem 'mysql' 
gem 'sqlite3-ruby'
gem 'json'
gem 'mole'
gem 'annotate'
gem 'haml'
gem 'cucumber'
gem 'webrat'

rake("gems:install", :sudo => true)
 
generate("rspec")

run "rm public/index.html"

git :init

run %{find . -type d -empty | xargs -I xxx touch xxx/.gitignore}
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

rake('db:sessions:create')
rake('db:migrate')
git :add => '.'
git :commit => "-a -m 'Initial commit'"
