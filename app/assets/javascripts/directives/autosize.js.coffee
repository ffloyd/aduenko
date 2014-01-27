@app.directive 'autosize', ->
  link: (scope, element, attrs) ->
    $(element).autosize()
