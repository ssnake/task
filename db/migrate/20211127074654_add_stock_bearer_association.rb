class AddStockBearerAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :bearer_stock_assocation do |t|
      t.references :bearer, foreign_key: :true
      t.references :stocks, foreign_key: :true
      t.timestamps
    end
  end
end
