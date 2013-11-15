@lunchHub.controller 'GroupShowCtrl', ['$scope', '$http', '$routeParams', 'Page', ($scope, $http, $routeParams, Page) ->
  $http.get("./groups/#{$routeParams.id}.json").success((data) ->
    Page.setTitle data.name
    $scope.group = data
  )
]
