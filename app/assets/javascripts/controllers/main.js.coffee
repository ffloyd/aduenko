@app.controller 'MainCtrl', ['$scope', 'Analyzer', ($scope, Analyzer) ->
  $scope.logs = []
  $scope.currentResultPage = 0
  $scope.results = []
  $scope.form = {
    title:    ''
    abstract: ''
  }

  $scope.pagesCount = ->
    count = Math.floor($scope.results.length/10)
    count += 1 if $scope.results.length % 10 > 0
    count

  $scope.processForm = (title, abstract) ->
    $scope.logs.push "Processing text.."
    Analyzer.process title, abstract, (data) ->
      $scope.results = data
      $scope.logs.push "Processing done. #{data.length} results."
      $scope.$apply()

  $scope.selectResult = (ids) ->
    $scope.logs.push "Sending selected result to server..."
    Analyzer.selectPair $scope.form.title, $scope.form.abstract, ids[0], ids[1], ->
      $scope.logs.push "Done!"
      $scope.$apply()

  $scope.clearFields = ->
    $scope.form.title = ''
    $scope.form.abstract = ''
]
