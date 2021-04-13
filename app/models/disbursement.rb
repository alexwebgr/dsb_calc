class Disbursement < ApplicationRecord
  validates :amount_payable, presence: true

  belongs_to :merchant
end
