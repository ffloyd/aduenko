@app.controller 'MainCtrl', ['$scope', 'Analyzer', ($scope, Analyzer) ->
  $scope.logs = []
  $scope.currentResultPage = 0
  $scope.results = []

  $scope.pagesCount = ->
    count = Math.floor($scope.results.length/5)
    count += 1 if $scope.results.length % 5 > 0
    count

  $scope.processForm = (title, content) ->
    $scope.logs.push "Processing text.."
    Analyzer.process title, content, (data) ->
      $scope.results = data
      $scope.logs.push "Processing done. #{data.length} results."
      $scope.$apply()

  $scope.selectResult = (ids) ->
    $scope.logs.push "Sending selected result to server..."
    Analyzer.selectPair ids[0], ids[1], ->
      $scope.logs.push "Done!"
      $scope.$apply()
]
