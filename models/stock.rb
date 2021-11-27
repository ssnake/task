require_relative "bearer_stock_association"

class Stock < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :bearer_stock_associations
  has_many :bearers, through: :bearer_stock_associations
  
end