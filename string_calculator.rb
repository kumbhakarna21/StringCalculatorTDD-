require 'byebug'

class NegativeNumbersError < StandardError
end

class StringCalculator
  def add(num_string)
    return 0 if num_string.nil? || num_string.empty? #we can write .blank? in rails for more cases like string with spaces but still empty
    delimiter, new_string = filter_and_get_delimiter(num_string)

    sanitised_num_arr = new_string.gsub(/[\n\t]/, ',').gsub(/[^0-9#{Regexp.escape(delimiter)}-]/, '').split(delimiter).map(&:to_i)
    sum = 0

    neg_arr = sanitised_num_arr.each_with_object([]) do |ele, neg_arr|
      neg_arr << ele if ele.negative?
      sum += ele
    end

    raise NegativeNumbersError, "negative numbers not allowed #{neg_arr.join(', ')}" if !neg_arr.empty?
    sum
  end

  private

  def filter_and_get_delimiter(num_string)
    if num_string.start_with?("//")
      match = num_string.match(%r{//(.+)\n(.*)})
      [match[1],match[2]]
    else
      [",", num_string]
    end
  end
end