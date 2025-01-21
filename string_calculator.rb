require 'byebug'

class StringCalculator
  def add(num_string)
    return 0 if num_string.nil? || num_string.empty? #we can write .blank? in rails for more cases like string with spaces but still empty
    delimiter, mew_string = filter_and_get_delimiter(num_string)

    mew_string.gsub(/[\n\t]/, ',').gsub(/[^0-9#{Regexp.escape(delimiter)}]/, '').split(delimiter).map(&:to_i).inject(:+)
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