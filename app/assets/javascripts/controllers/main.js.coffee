@app.controller 'MainCtrl', ['$scope', 'Analyzer', ($scope, Analyzer) ->
  $scope.logs = []

  $scope.processForm = (title, content) ->
    $scope.logs.push "Processing text.."
    Analyzer.process title, content, ->
      $scope.logs.push "Processing done."
]
