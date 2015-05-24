$LOAD_PATH.unshift 'lib', __dir__
root_dir      = File.expand_path '.', __dir__
data_filepath = "#{root_dir}/data/data.json"

task default: 'test'


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

  require 'import'
  Import.call data_filepath
end


desc 'Pull the data from the internet, save it to a local file'
task 'scrape' do
  require 'scrape'
  Scrape.call data_filepath
end


desc 'Import the scraped data into the database'
task 'import' do
  require 'app_env'
  AppEnv.new(root_dir, 'development').load

  require 'import'
  Import.call data_filepath
end
