FactoryBot.define do
  factory :stock do
    sequence(:name) {|n| "stock_#{n}" }  
  end
end