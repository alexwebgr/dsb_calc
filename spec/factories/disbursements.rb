FactoryBot.define do
  factory :disbursement do
    amount_payable { 1.5 }
    merchant
  end
end
