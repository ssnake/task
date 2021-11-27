class AddStockBearerAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :bearer_stock_associations do |t|
      t.references :bearer, foreign_key: :true
      t.references :stock, foreign_key: :true
      t.timestamps
    end
  end
end
