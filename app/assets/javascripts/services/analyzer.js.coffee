@app.factory 'Analyzer', ->
  service =

    process: (title, abstract, success) ->
      $.post '/process_text.json', {title: title, abstract: abstract}, (data) ->
        success(data)

    selectPair: (title, abstract, area_id, stream_id, success) ->
      $.post '/save_result.json', {
        title: title
        abstract: abstract
        area_id: area_id
        stream_id: stream_id
      }, ->
        success()
