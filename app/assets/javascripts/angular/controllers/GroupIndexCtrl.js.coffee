@lunchHub.controller 'GroupIndexCtrl', ['$scope', '$location', '$http', 'Page', ($scope, $location, $http, Page) ->
  $scope.groups = []
  $http.get('./groups.json').success((data) ->
    Page.setTitle "Groups"
    $scope.groups = data
  )

  $scope.viewPost = (id) ->
    $location.url('/groups/' + id)
]
