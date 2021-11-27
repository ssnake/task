class BearerStockAssociationSerializer
  include JSONAPI::Serializer
  set_type :bearer_stock_assocation
  belongs_to :bearer
  belongs_to :stock
end