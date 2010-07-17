run "echo TODO > README"

gem 'haml'
gem 'prawn'
gem 'mislav-will_paginate', :lib=>'will_paginate',:source=>'http://gems.github.com'
gem 'formtastic'
gem "rmagick", :lib => "RMagick2"
gem "spreadsheet"
gem "aws-s3", :lib=>'aws/s3'
gem "chronic"
gem 'javan-whenever', :lib=>false, :source => 'http://gems.github.com'
gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'
gem 'delayed_job'
gem 'calendar_date_select'
gem 'formtastic_calendar_date_select', :source=>"http://gemcutter.org"
rake 'gems:install'

plugin :make_resourceful, :svn=>'http://svn.hamptoncatlin.com/make_resourceful/tags/make_resourceful'
plugin "state_machine", :git=>"git://github.com/pluginaweek/state_machine.git"
plugin "rspec", :git=>"git://github.com/dchelimsky/rspec.git"
plugin "rspec-rails", :git=>"git://github.com/dchelimsky/rspec-rails.git"
plugin :mimetype_fu, :svn=>"http://mimetype-fu.googlecode.com/svn/trunk/"
plugin :formtastic_calendar_date_select, :git=>"git://github.com/dyohi/formtastic_calendar_date_select"
plugin :exception_notification
plugin :attachment_fu, :git=>'git://github.com/technoweenie/attachment_fu.git'
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

