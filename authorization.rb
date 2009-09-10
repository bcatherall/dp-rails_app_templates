# use role_requirements?
if yes? ("Use role_requirements") {
  plugin 'role_requirements', :git =>'git://github.com/timcharper/role_requirement.git', :submodule => true
  git :submodule => "init"
  generate(:roles, "Role User")
}
# use declarative_authorization
if yes? ("User declarative_authorization") {
  gem 'stffn-declarative_authorization', :lib => 'declarative_authorization'
  rake("gems:install", :sudo => true)
}
