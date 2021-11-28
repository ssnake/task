# frozen_string_literal: true

class RemoveBearerFkFromStocks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :stocks, :bearer, index: true, foreign_key: true
  end
end
