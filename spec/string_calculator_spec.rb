require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  context 'handling empty string' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns 0 for an null value' do
      expect(calculator.add(nil)).to eq(0)
    end
  end
end
