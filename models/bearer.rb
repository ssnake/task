
class Bearer < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :bearer_stock_associations
  has_many :stocks, through: :bearer_stock_associations
end