set :stage, :production
set :rails_env, :production
set :branch, "master"

server "13.232.68.236", user: "ubuntu", roles: %w{app db web}