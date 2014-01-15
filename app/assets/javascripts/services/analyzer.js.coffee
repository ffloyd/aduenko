@app.factory 'Analyzer', ->
  service =
    process: (title, content, success) ->
      $.post '/process_text.json', {title: title, content: content}, (data) ->
        success(data)
    select_pair: (area_index, stream_index) ->
      alert "Select pair: #{area_index} #{stream_index}"
