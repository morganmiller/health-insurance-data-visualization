$LOAD_PATH << File.expand_path('lib', __dir__)
require 'app_env'

root_dir = File.expand_path '.', __dir__
AppEnv.new(root_dir, 'development').load

require 'mah_app'
run MahApp
