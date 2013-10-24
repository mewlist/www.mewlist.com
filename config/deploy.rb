set :application, 'mewlist.com'
set :repo_url, 'git@github.com:mewlist/mewlist.com.git'
set :deploy_to, '~/web/mewlist.com'
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_ruby_version, "2.0.0-p247"

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  task :assets do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{release_path}; pwd; RAILS_ENV=production bundle exec rake assets:precompile"
    end
  end

  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{release_path}; pwd; bundle exec unicorn_rails -E production -D -c config/unicorn.rb"
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill `cat /tmp/pids/unicorn.pid`"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

  task :migrate do
    on roles(:db), in: :sequence, wait: 5 do
      execute "cd #{release_path}; pwd; bundle exec rake db:migrate RAILS_ENV=production"
    end
  end

  after :published, 'deploy:symlink_sqlite'
  task :symlink_sqlite do
    on roles(:db), in: :sequence, wait: 5 do
      execute "cd #{release_path}; pwd; ln -s #{shared_path}/db/production.sqlite3 db/production.sqlite3"
    end
  end
end
