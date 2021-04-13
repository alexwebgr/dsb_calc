FactoryBot.define do
  factory :shopper do
    name { "MyString" }
    email { "MyString#{rand(1000)}" }
    nif { "MyString" }
  end
end
