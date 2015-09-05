class AddDocumentAttributes < ActiveRecord::Migration
  def change
    add_column :documents, :amount, :integer
    add_column :documents, :interest_rate, :integer
    add_column :documents, :down_payment, :integer
  end
end

