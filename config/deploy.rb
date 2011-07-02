set :application, "mybabysit"
set :repository,  "git@github.com:blueguitarenator/sittercalling.git"

set :scm, :git

set :scm_username, 'mybabysi'
set :user, 'mybabysi'
set :use_sudo, false
set :branch, "master"
set :deploy_to, "/home/mybabysi/#{application}"
set :deploy_via, :checkout
default_run_options[:pty] = true

role :web, "jason.asmallorange.com"                          # Your HTTP server, Apache/etc
role :app, "jason.asmallorange.com"                          # This may be the same as your `Web` server
role :db,  "jason.asmallorange.com", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end