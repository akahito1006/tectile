class Batch::DataReset
  def self.data_reset
    exec("RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:reset")
  end
end