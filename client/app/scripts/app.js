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

app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $locationProvider.html5Mode(true);
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .when('/today', {
      templateUrl: 'views/announcements.html',
      controller: 'AnnouncementsCtrl',
      resolve: {
        auth: ['$auth', function($auth) {
          return $auth.validateUser();
        }]
      }
    })
    .when('/profile', {
      templateUrl: 'views/users/edit.html',
      controller: 'UsersCtrl',
      resolve: {
        auth: ['$auth', function($auth) {
          return $auth.validateUser();
        }]
      }
    })
    .when('/groups', {
      templateUrl: 'views/groups.html',
      controller: 'GroupsCtrl'
    })
    .when('/sign_in', {
      templateUrl: 'views/user-sessions/new.html',
      controller: 'UserSessionsCtrl'
    })
    .when('/sign_up', {
      templateUrl: 'views/user-registrations/new.html',
      controller: 'UserRegistrationsCtrl'
    })
    .otherwise({
      redirectTo: '/'
    });
}]);

app.config(['$authProvider', function($authProvider) {
  $authProvider.configure({
    apiUrl: '/api'
  });
}]);

app.factory('Announcement', ['railsResourceFactory', function (railsResourceFactory) {
  return railsResourceFactory({ url: '/api/announcements', name: 'announcement' });
}]);

app.factory('Group', ['railsResourceFactory', function (railsResourceFactory) {
  return railsResourceFactory({ url: '/api/groups', name: 'group' });
}]);

app.run(['$rootScope', '$location', function($rootScope, $location) {
  $rootScope.$on('auth:login-success', function() {
    $location.path('/today');
  });
  $rootScope.$on('auth:logout-success', function() {
    $location.path('/sign_in');
  });
}]);
