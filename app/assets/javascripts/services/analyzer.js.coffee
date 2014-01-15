@app.factory 'Analyzer', ->
  service =
    process: (title, content) ->
      alert "Process: #{title}"
    select_pair: (area_index, stream_index) ->
      alert "Select pair: #{area_index} #{stream_index}"
