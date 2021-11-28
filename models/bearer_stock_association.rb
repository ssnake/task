# frozen_string_literal: true

class BearerStockAssociation < ActiveRecord::Base
  belongs_to :stock
  belongs_to :bearer
end
