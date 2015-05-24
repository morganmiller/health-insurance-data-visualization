$LOAD_PATH.unshift 'lib', __dir__
root_dir = File.expand_path '.', __dir__

desc 'Start the server for the application'
task 'server' do
  sh 'rackup config.ru'
end

desc 'Run my tests!'
task 'test' do
  sh 'mrspec -I test'
end

desc 'Reset the development environment'
task 'reset' do
  require 'app_env'
  AppEnv.new(root_dir, 'development').reset
end

task default: 'test'
