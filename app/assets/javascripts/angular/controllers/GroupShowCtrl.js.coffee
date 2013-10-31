@lunchHub.controller 'GroupShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./groups/#{$routeParams.id}.json").success((data) ->
    $scope.group = data
  )
]
