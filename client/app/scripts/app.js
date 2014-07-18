'use strict';

/**
 * @ngdoc overview
 * @name lunchHubApp
 * @description
 * # lunchHubApp
 *
 * Main module of the application.
 */
var app = angular.module('lunchHubApp', [
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngRoute',
  'ngSanitize',
  'ngTouch'
]);

app.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .when('/groups', {
      templateUrl: 'views/groups.html',
      controller: 'GroupsCtrl'
    })
    .otherwise({
      redirectTo: '/'
    });
});

app.factory('Group', ['$resource', function($resource) {
  return $resource('/api/groups/:id.json', null,
    {
      'update': { method:'PUT' }
    });
}]);
