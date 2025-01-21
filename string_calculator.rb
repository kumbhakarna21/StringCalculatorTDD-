class StringCalculator
  def add(num_string)
    return 0 if num_string.nil? || num_string.empty? #we can write .blank? in rails for more cases like string with spaces but still empty
  end
end