# config valid only for current version of Capistrano
lock "3.12.0"

set :application, "inventory_rails"
set :repo_url, "git clone git@bitbucket.org:maricodingmart/inventory_rails.git"

# restart app by running: touch tmp/restart.txt
# at server machine
set :passenger_restart_with_touch, true

##################################################################################################################################
set :puma_threads,    [4, 16]

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/inventory_rails"