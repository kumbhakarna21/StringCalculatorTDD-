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

  context 'handle any amount of numbers' do
    it 'returns sum for an given number string' do
      expect(calculator.add("1,2,3")).to eq(6)
      expect(calculator.add("4,5,6,7,8")).to eq(30)
      expect(calculator.add("10,20,30,40,50,60")).to eq(210)
    end
  end
end
