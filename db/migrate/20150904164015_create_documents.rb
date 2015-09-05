class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user, index: true
      t.string :title, :default => "Loan Application"

      t.timestamps null: false
    end
  end
end
