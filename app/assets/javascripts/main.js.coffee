@lunchHub = angular.module('lunchHub', [])

@lunchHub.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/groups', {
      templateUrl: '../templates/groups/index.html',
      controller: 'GroupIndexCtrl'
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

@lunchHub.factory "Page", ->
  title = "default"
  title: ->
    title

  setTitle: (newTitle) ->
    title = newTitle

@lunchHub.controller 'titleCtrl', ['$scope', 'Page', ($scope, Page) ->
  $scope.Page = Page
]
