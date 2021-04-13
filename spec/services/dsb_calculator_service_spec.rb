require 'rails_helper'

RSpec.describe DsbCalculatorService, type: :service do
  describe '#calculate' do
    context 'when the amount is 0' do
      it 'returns 0' do
        expect(described_class.calculate(0)).to eq 0.000
      end
    end

    context 'when the amount is below 50' do
      it 'returns 0.490 for 49' do
        expect(described_class.calculate(49)).to eq 0.490
      end
    end

    context 'when the amount is between 50 and 300' do
      it 'returns 0.475 for 50' do
        expect(described_class.calculate(50)).to eq 0.475
      end

      it 'returns 0.484 for 51' do
        expect(described_class.calculate(51)).to eq 0.484
      end

      it 'returns 2.850 for 300' do
        expect(described_class.calculate(300)).to eq 2.850
      end
    end

    context 'when the amount is above 300' do
      it 'returns 2.559 for 301' do
        expect(described_class.calculate(301)).to eq 2.559
      end
    end
  end
end