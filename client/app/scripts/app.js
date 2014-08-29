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
  'ngTouch',
  'rails',
  'ng-token-auth'
]);

app.config(function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .when('/groups', {
      templateUrl: 'views/groups.html',
      controller: 'GroupsCtrl'
    })
    .when('/sign_in', {
      templateUrl: 'views/user_sessions/sign_in.html',
      controller: 'UserSessionsCtrl'
    })
    .otherwise({
      redirectTo: '/'
    });
});

app.config(function($authProvider) {
  $authProvider.configure({
    apiUrl: '/api'
  });
});

app.factory('Group', ['railsResourceFactory', function (railsResourceFactory) {
  return railsResourceFactory({ url: '/api/groups', name: 'group' });
}]);
