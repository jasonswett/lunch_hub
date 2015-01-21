'use strict';

/**
 * @ngdoc overview
 * @name lunchHubApp
 * @description
 * # lunchHubApp
 *
 * Main module of the application.
 */
angular.module('lunchHubApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'rails',
    'ng-token-auth'
  ]).
  config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        isPublic: true
      })
      .when('/today', {
        templateUrl: 'views/announcements.html',
        controller: 'AnnouncementsCtrl'
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
        controller: 'UserSessionsCtrl',
        isPublic: true
      })
      .when('/sign_up', {
        templateUrl: 'views/user-registrations/new.html',
        controller: 'UserRegistrationsCtrl',
        isPublic: true
      })
      .otherwise({
        redirectTo: '/'
      });
  }]).
  config(['$authProvider', function($authProvider) {
    $authProvider.configure({
      apiUrl: '/api'
    });
  }]).
  factory('Announcement', ['railsResourceFactory', function (railsResourceFactory) {
    return railsResourceFactory({ url: '/api/announcements', name: 'announcement' });
  }]).
  factory('Group', ['railsResourceFactory', function (railsResourceFactory) {
    return railsResourceFactory({ url: '/api/groups', name: 'group' });
  }]).
  run(['$rootScope', '$auth', '$location', function($rootScope, $auth, $location) {
    $rootScope.$on('auth:login-success', function() {
      $location.path('/today');
    });
    $rootScope.$on('auth:logout-success', function() {
      $location.path('/sign_in');
    });
    $rootScope.$on('$routeChangeStart', function(event, next) {
      $auth.validateUser().then(function(response) {
        if ($location.path() == '/') {
          $location.path('/today');
        }
      }, function() {
        if (!next.isPublic) {
          $location.path('/sign_in');
        }
      });
    });
  }]);
