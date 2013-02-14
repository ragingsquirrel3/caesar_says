require './lib/assets/roman_numeral_evaluator'

class CalculatorController < ApplicationController
  def index
  end
  
  # json endpoint for remote calculation
  def calculate
    puts "IN ARABC IS BELOW"
    puts params[:in_arabic]
    sleep 1
    @problem = params[:problem]
    
    # solution is arabic when in_arabic is true
    @solution = params[:in_arabic] == 'true' ? RomanNumeralEvaluator.solve_as_integer(params[:problem]).to_s : RomanNumeralEvaluator.solve(params[:problem]).to_s
    
    render json: { problem: @problem, solution: @solution }
  end
end
