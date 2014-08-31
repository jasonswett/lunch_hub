'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UserSessionsCtrl', ['$rootScope', '$location', function ($rootScope, $location) {
    $rootScope.$on('auth:login-success', function() {
      $location.path('/');
    });
    $rootScope.$on('auth:login-error', function(ev, reason) {
      window.alert('error: ' + reason.errors[0]);
    });
  }]);
