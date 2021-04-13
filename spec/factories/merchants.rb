FactoryBot.define do
  factory :merchant do
    name { "MyString" }
    email { "MyString#{rand(1000)}" }
    cif { "MyString" }
  end
end
