@lunchHub.controller 'GroupIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.groups = []
  $http.get('./groups.json').success((data) ->
    $scope.groups = data
  )

  $scope.viewPost = (id) ->
    $location.url('/groups/' + id)
]
