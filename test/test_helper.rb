require 'minitest/spec'
require 'rack/test'
require 'app_env'

root_dir = File.expand_path '..', __dir__
app_env = AppEnv.new(root_dir, 'test')
app_env.reset
require 'mah_app'

RSpec.configure do |config|
  config.around do |spec|
    ActiveRecord::Base.transaction do
      spec.call
      raise ActiveRecord::Rollback
    end
  end
end
