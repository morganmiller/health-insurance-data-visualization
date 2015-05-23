require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
ActiveRecord::Base.logger = Logger.new $stdout
ActiveSupport::LogSubscriber.colorize_logging = false

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :plans do |t|
    t.string :state
    t.integer :child_premium
    t.string :plan_type
  end
end


class Plan < ActiveRecord::Base

end
