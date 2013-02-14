$("#calculator-form").submit( ->
  bubble = $('#bubble')
  input_form = $("#calculator-form input[type='text']")[0]
  solution_text = $('#solution')
  whit = $('#whit')
  
  # begin thought animation
  bubble.addClass('thinking')
  solution_text.empty()
  whit.empty()
  
  # collect values, fetch solution
  $.ajax '/calculator/calculate',
    method: 'get'
    data :
      problem : input_form.value
      in_arabic: $("#in_arabic_true").is(':checked')
      
    success: (data, textStatus, jqXHR) ->
      # write_solution, plus random whitty expression
      solution_text.text("#{input_form.value} is #{data['solution']}")
      whitty_expressions = [
        'Any more brain busters?',
        'Try mixing Roman and Arabic numerals (like 10 * V).'
      ]
      whit.text(whitty_expressions[Math.round(Math.random() * whitty_expressions.length) - 1])
      
    error    : ->
      solution_text.text("Sorry, can't do that one.")
    
    complete : -> 
      # remove bubble animation
      bubble.removeClass('thinking')
)
