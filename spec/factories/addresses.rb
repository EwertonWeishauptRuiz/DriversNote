FactoryBot.define do
  factory :address do    
    address1 { "MyString" }   
    postal_code { "MyString" }
    city { "MyString" }
    country { "MyString" }
    user
  end
end
