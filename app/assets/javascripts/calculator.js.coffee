$("#calculator-form").submit( ->
  bubble = $('#bubble')
  input_form = $("#calculator-form input[type='text']")[0]
  solution_text = $('#solution')
  
  # begin thought animation
  bubble.addClass('thinking')
  solution_text.empty()
  
  # collect values, fetch solution
  $.ajax '/calculator/calculate',
    method: 'get'
    data :
      problem : input_form.value
      in_arabic: $("#in_arabic_true").is(':checked')
    success: (data, textStatus, jqXHR) ->
      # write_solution
      solution_text.text("#{input_form.value} is #{data['solution']}")
    error    : ->
      solution_text.text("Sorry, can't do that one.")
    complete : -> 
      # remove bubble animation
      bubble.removeClass('thinking')
)
