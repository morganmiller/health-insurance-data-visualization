require 'active_record'
require 'logger'

class AppEnv
  attr_reader :environment, :root_dir

  def initialize(root_dir, environment)
    @root_dir    = root_dir
    @environment = environment
  end

  def reset
    rm db_file
    load
    define_schema
  end

  def load
    ensure_dirs 'db', 'log'
    ENV["RAILS_ENV"] = environment # ...might be needed by ActiveRecord::Base... not sure
    ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: db_file
    ActiveRecord::Base.logger = logger
  end

  private

  def define_schema
    verbose = be_verbose?

    ActiveRecord::Schema.define do
      self.verbose = verbose

      create_table :plans do |t|
        t.string :state
        t.integer :child_premium
        t.string :plan_type
      end
    end
  end

  def be_verbose?
    environment != 'test'
  end

  def rm(filepath)
    File.delete filepath if File.exist? filepath
  end

  def logger
    @logger ||= Logger.new log_file
  end

  def ensure_dirs(*dirnames)
    dirnames.each do |dirname|
      Dir.mkdir dirname unless Dir.exist? dirname
    end
  end

  def db_file
    path_to "db/#{environment}.sqlite3"
  end

  def log_file
    path_to "log/#{environment}.log"
  end

  def path_to(file)
    File.join root_dir, file
  end
end
