class Shopper < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true
end
