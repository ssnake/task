# frozen_string_literal: true

FactoryBot.define do
  factory :bearer do
    sequence(:name) { |n| "bearer_#{n}" }
  end
end
