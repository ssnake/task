# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.index :name, unique: true
      t.boolean :is_deleted, default: false
      t.index :is_deleted
      t.references :bearer, foreign_key: true
      t.timestamps
    end
  end
end
