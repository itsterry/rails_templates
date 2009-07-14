run "echo TODO > README"

gem 'haml'
gem 'prawn'
gem 'mislav-will_paginate', :lib=>'will_paginate',:source=>'http://gems.github.com'
rake 'gems:install'

plugin :make_resourceful, :svn=>'http://svn.hamptoncatlin.com/make_resourceful/tags/make_resourceful'

plugin "rspec", :git=>"git://github.com/dchelimsky/rspec.git"
plugin "rspec-rails", :git=>"git://github.com/dchelimsky/rspec-rails.git"
generate :rspec

#plugin :restful_authentication, :svn=>'http://svn.techno-weenie.net/projects/plugins/restful_authentication'
#generate :authenticated, "user sessions"
#rake 'db:migrate'
#route "map.signup '/signup', :controller=>'users', :action=>'new'"
#route "map.login '/login',  :controller=>'sessions', :action=>'new'"
#route "map.logout '/logout',  :controller=>'sessions', :action=>'destroy'"
#route "map.resources :users"
#route "map.resources :sessions"


generate :rspec_controller, "home index"
route "map.root :controller=>'home'"

git :init

file ".gitignore", <<END
.DS_Store
log/*.log
tmp/**/*
END

run "touch tmp/.gitignore log/.gitignore"
git :rm=>"public/index.html"

git :add => '.'
git :commit =>"-m 'initial commit'"

