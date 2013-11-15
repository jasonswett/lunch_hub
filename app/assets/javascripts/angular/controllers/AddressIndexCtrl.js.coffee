@lunchHub.controller 'AddressIndexCtrl', ['$scope', '$location', '$http', 'Page', ($scope, $location, $http, Page) ->
  $scope.addresses = []
  $http.get('./addresses.json').success((data) ->
    Page.setTitle "Addresses"
    $scope.addresses = data
  )

  $scope.viewAddress = (id) ->
    $location.url('/addresses/' + id)
]
