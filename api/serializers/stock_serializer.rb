class StockSerializer
  include JSONAPI::Serializer
  set_type :stock
  has_many :bearers, through: :bearer_stock_associations
  attributes :name
end