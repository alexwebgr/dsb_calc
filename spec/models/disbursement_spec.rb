require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe 'associations' do
    it { should belong_to(:merchant) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount_payable) }
  end
end
