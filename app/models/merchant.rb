class Merchant < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cif, presence: true

  has_many :orders
end
