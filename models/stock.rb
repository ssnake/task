class Stock < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :bearer
  
end