set :application, "mrloop"
set :repository,  "."
set :deploy_via, :copy

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "mrloop"                          # Your HTTP server, Apache/etc
role :app, "mrloop"                          # This may be the same as your `Web` server

set :deploy_to, "~/cap_deploy"

after 'deploy', 'remote:create_symlink'

namespace :remote do
  desc <<-DESC
    link current release to public_html
  DESC
  task :create_symlink, :roles => :web do
    run "rm -rf public_html;ln #{current_path} public_html"
  end
end


# Override default tasks which are not relevant to a non-rails app.
namespace :deploy do
  task :migrate do
    puts "    not doing migrate because not a Rails application."
  end
  task :finalize_update do
    puts "    not doing finalize_update because not a Rails application."
  end
  task :start do
    puts "    not doing start because not a Rails application."
  end
  task :stop do 
    puts "    not doing stop because not a Rails application."
  end
  task :restart do
    puts "    not doing restart because not a Rails application."
  end
end
