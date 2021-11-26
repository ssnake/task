class BearerSerializer 
  include JSONAPI::Serializer
  set_type :bearer
  has_many :stocks
  attributes :name
end