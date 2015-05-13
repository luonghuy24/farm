set :application, 'farm'
# uncomment the below line if you encounter error: `require': cannot load such file -- rvm/capistrano
# $:.unshift("#{ENV["HOME"]}/.rvm/lib")
require "rvm/capistrano"
# set :rvm_type, :user
set :rvm_ruby_string, "2.2.0@#{application}"
# set :rvm_bin_path, "/usr/local/rvm/bin"

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano_colors'
load 'deploy'

set :stages, %w(staging production)
set :default_stage, 'staging'
task :staging do
  set :stage, 'staging'
  set :branch, 'develop'
  set :rails_env, 'staging'
  set :user, 'harry'
end
task :production do
  set :stage, 'production'
  set :branch, 'production'
  set :rails_env, 'production'
  set :user, 'deploy'
end

set :scm, :git
# set :git_enable_submodules,1
set :deploy_via, :remote_cache
set :repository, "git@github.com:luonghuy24/farm.git"
set(:domain) { {'staging' => "farm.happycoding.vn", 'production' => 'farm.happycoding.vn' }[stage] }

set(:deploy_to) { "/home/#{user}/#{application}_#{stage}" }
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
role(:app) { domain }
role(:web) { domain }
role(:db, :primary => true) { domain }

namespace :bundle do
  task :install, :roles => [:app] do
    run "cd #{release_path} && bundle install --without development test deploy"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

namespace :deploy do
  task :restart, :roles => [:app]  do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :assets do
  task :precompile, :roles => [:app] do
    run "cd #{release_path} && bundle exec rake assets:precompile RAILS_ENV=production"
  end
end

after 'deploy:update_code', 'rvm:trust_rvmrc', 'assets:precompile', 'carrierwave:symlink'
after 'deploy', 'deploy:cleanup', 'copy_nondigest_assets'

namespace :carrierwave do
  desc "Symlink Carrierwave uploaded images"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/uploads && ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

## Fast deploy & utilities

set(:deploy_update) { "cd #{current_path} && git pull origin #{branch} && bundle" }
set(:deploy_restart) { "cd #{current_path} && touch tmp/restart.txt" }
set(:deploy_precompile_assets) { "cd #{current_path} && bundle exec rake assets:precompile RAILS_ENV=production" }

CMDS = 'git commit -am "changes"; git pull; git push'
task :d do
  # %x[#{CMDS}]
  run deploy_update
  run deploy_restart
end

task :dd do
  # %x[#{CMDS}]
  run deploy_update
  run deploy_precompile_assets
  run deploy_restart
end

task :t do
  run "tail -f #{shared_path}/log/#{stage}.log"
end

task :remake do
  run "cd #{current_path} && bundle exec rake db:remake RAILS_ENV=#{rails_env}"
end
