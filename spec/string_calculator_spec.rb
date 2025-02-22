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

  context 'handle new lines between numbers (instead of commas)' do
    it 'returns sum for an given number_string with new_lines' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns sum for an given number_string with tab_lines' do
      expect(calculator.add("1\n2,\n\n\t3")).to eq(6)
    end
  end

  context 'handle number string with delimiter at beginning of the string' do
    it 'returns sum for an given number_string with delimeters(;)' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'returns sum for an given number_string with delimeters(;)' do
      expect(calculator.add("//;\n1; \t5; &!b3")).to eq(9)
    end
  end

  context 'handle number string with negative number' do
    it 'throws exception if negative number present' do
      expect { calculator.add("\n1, \t-10, -30") }.to raise_error(NegativeNumbersError, "negative numbers not allowed -10, -30")
      expect { calculator.add("\n1, \t-23, &!b-21") }.to raise_error(NegativeNumbersError, "negative numbers not allowed -23, -21")
    end
  end
end
