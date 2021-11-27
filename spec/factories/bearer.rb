FactoryBot.define do
  sequence :bearer_name do |n|
    "bearer_#{n}"
  end

  factory :bearer do
    name { generate(:bearer_name) }  
  end
end