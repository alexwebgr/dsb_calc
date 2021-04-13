class Order < ApplicationRecord
  validates :amount, presence: true

  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where.not(completed_at: nil) }
end
