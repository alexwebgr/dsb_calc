FactoryBot.define do
  factory :order do
    amount { 1.5 }
    completed_at { "2021-04-13 10:29:41" }
    merchant
    shopper
  end
end
