@lunchHub = angular.module('lunchHub', [])

@lunchHub.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/addresses', {
      templateUrl: '../templates/addresses/index.html',
      controller: 'AddressIndexCtrl'
    }).
    when('/groups', {
      templateUrl: '../templates/groups/index.html',
      controller: 'GroupIndexCtrl'
    }).
    when('/groups/new', {
      templateUrl: '../templates/groups/new.html',
      controller: 'GroupNewCtrl'
    }).
    when('/groups/:id', {
      templateUrl: '../templates/groups/show.html',
      controller: 'GroupShowCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
])
