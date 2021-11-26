class StockSerializer
  include JSONAPI::Serializer
  set_type :stock
  belongs_to :bearer
  attributes :name
end