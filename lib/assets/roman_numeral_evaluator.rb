require_relative 'roman_numerals'

class RomanNumeralEvaluator
  
  # problem is a string representing a Roman math problem, such as 'I + I'. Returns roman result, as a string, such as 'II'
  def solve(problem)
    RomanNumerals.to_roman(solve_as_integer(problem.upcase))
  end
  
  # Takes 'I + I', returns 2.  Recursively replaces a first Roman numeral in a string with decimal.
  def solve_as_integer(problem)
    # replaces strings in problem with corresponding integers, eval result
    valid_numeral_pattern = /(M{1,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|C?D|D?C{1,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|X?L|L?X{1,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|I?V|V?I{1,3}))/
     
    if problem.match(valid_numeral_pattern)
      # There are roman characters.   Replace the first word, solve the result.
      solve_as_integer(problem.sub(valid_numeral_pattern){ |n| RomanNumerals.to_decimal(n) })
    else
      # Base Case:  There are no roman characters in problem.  We're done. Return the evaluated result.
      eval(problem)
    end
  end
  
end
