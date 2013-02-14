module RomanNumeralEvaluator
  
  VALID_NUMERICAL_PATTERN = /(M{1,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|C?D|D?C{1,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|X?L|L?X{1,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|I?V|V?I{1,3}))/
    
  # problem is a string representing a Roman math problem, such as 'I + I'. Returns roman result, as a string, such as 'II'
  def self.solve(problem)
    to_roman(solve_as_integer(problem.upcase))
  end
  
  # Takes 'I + I', returns 2.  Recursively replaces a first Roman numeral in a string with decimal.
  def self.solve_as_integer(problem)
    # replaces strings in problem with corresponding integers, eval result
     
    if problem.match(VALID_NUMERICAL_PATTERN)
      # There are roman characters.  Replace the first word, solve the result.
      solve_as_integer(problem.sub(VALID_NUMERICAL_PATTERN){ |n| to_decimal(n) })
    else
      # Base Case:  There are no roman characters in problem.  We're done. Return the evaluated result.
      eval(problem)
    end
  end
  
  DIGITS = {
    1    => 'I',
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    10   => 'X',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    100  => 'C',
    400  => 'CD',
    500  => 'D',
    900  => 'CM',
    1000 => 'M'
  }
  
  def self.to_roman(value)
    result = ''
    DIGITS.keys.reverse.each do |decimal|
      while value >= decimal
        value -= decimal
        result = result << DIGITS[decimal]
      end
    end
    result
  end
  
  def self.to_decimal(value)
    result = 0
    DIGITS.values.reverse.each do |roman|
      while value.start_with? roman
        value = value.slice(roman.length, value.length)
        result += DIGITS.key roman
      end
    end
    result
  end
  
  def self.is_roman?(value)
    value.match(VALID_NUMERICAL_PATTERN)
  end
  
end