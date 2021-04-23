class Batch::DataReset
  def self.data_reset
    exec("rails db:reset")
  end
end