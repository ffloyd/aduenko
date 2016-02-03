# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
set :user, 'aduenko'
set :server_name, '82.196.6.163'
server  fetch(:server_name),
        user: fetch(:user),
        roles: %w{web app db}

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

# because default is 'satging'
set :rails_env, 'production'

set :unicorn_pid, File.join(shared_path, "tmp", "pids", "unicorn.pid")

# env variables for unicorn
set :default_env, {
  unicorn_pid:    fetch(:unicorn_pid),
  unicorn_socket: File.join(shared_path, "tmp", "sockets", "unicorn.sock"),
  unicorn_log:    File.join(shared_path, "log", "unicorn.log")
}

# 2 DJ workers
set :delayed_job_args, "-n 2"
