desc 'Start the server for the application'
task 'server' do
  sh 'rackup config.ru'
end


desc 'Run my tests!'
task 'test' do
  sh 'mrspec -I test'
end


task default: 'test'
