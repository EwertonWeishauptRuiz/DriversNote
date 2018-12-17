FactoryBot.define do
  factory :order do
    user { nil }
    address { nil }
    beacons { 1 }
    total_price { "9.99" }
  end
end
