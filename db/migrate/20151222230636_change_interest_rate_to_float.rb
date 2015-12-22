class ChangeInterestRateToFloat < ActiveRecord::Migration
  def self.up
    change_column :documents, :interest_rate, :float
  end
 
  def self.down
    change_column :documents, :interest_rate, :integer
  end
end
