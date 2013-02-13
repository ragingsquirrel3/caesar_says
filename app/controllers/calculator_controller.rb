require './lib/assets/roman_numeral_evaluator'

class CalculatorController < ApplicationController
  def index
    if params[:problem]
      evaluator = RomanNumeralEvaluator.new
      @problem = params[:problem]
      @solution = evaluator.solve(params[:problem])
    end
  end
  
  def calculate
  end
end
