# frozen_string_literal: true

class BearerSerializer
  include JSONAPI::Serializer
  set_type :bearer
  has_many :stocks, through: :bearer_stock_associations
  attributes :name
end
