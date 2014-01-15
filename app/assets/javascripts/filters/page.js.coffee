@app.filter 'page', ->
  (items, pageSize, pageNum) -> # pageNum begins at 0
    items.slice(pageSize*pageNum, pageSize*(pageNum+1))
