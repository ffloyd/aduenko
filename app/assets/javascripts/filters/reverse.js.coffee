@app.filter 'reverse', ->
  (items) ->
    items.slice().reverse()
