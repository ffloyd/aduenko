@app.factory 'Analyzer', ->
  service =

    process: (title, content, success) ->
      $.post '/process_text.json', {title: title, content: content}, (data) ->
        success(data)

    selectPair: (title, content, area_id, stream_id, success) ->
      $.post '/save_result.json', {
        title: title
        content: content
        area_id: area_id
        stream_id: stream_id
      }, ->
        success()
