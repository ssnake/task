
class Bearer < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :stocks
  
end