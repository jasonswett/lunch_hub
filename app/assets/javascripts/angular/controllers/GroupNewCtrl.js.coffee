@lunchHub.controller 'GroupNewCtrl', ['$scope', '$location', '$http', 'Page', ($scope, $location, $http, Page) ->
  Page.setTitle "New Group"

  $scope.update = () ->
    $http.post("./groups.json", $scope.group).
      success((data) ->
        $location.url '/groups'
      ).
      error((data) ->
        alert "Group name #{data.name[0]}"
      )
]
