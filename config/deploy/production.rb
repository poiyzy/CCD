set :application, "cctvoe"
set :domain, "rails.jiazhang.org"
set :repository,  "git@github.com:poiyzy/cctvoe.git"
set :deploy_to, "/home/apps/cctvoe"

role :app, domain
role :web, domain
role :db, domain, :primary => true
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master" 
set :scm_verbose, true 
set :use_sudo, false
set :user, "apps"
set :group, "apps"

default_environment["PATH"] = "/usr/local/bin/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"

namespace :deploy do 
  desc "restart" 
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end

desc "Create database.yml and asset packages for production" 
after("deploy:update_code") do
  db_config = "#{shared_path}/config/database.yml.production"
  run "cp #{db_config} #{release_path}/config/database.yml"
end