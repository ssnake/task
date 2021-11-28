# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    sequence(:name) { |n| "stock_#{n}" }
  end
end
