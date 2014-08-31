'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UserSessionsCtrl', ['$scope', '$rootScope', '$location', function ($scope, $rootScope, $location) {
    $rootScope.$on('auth:login-success', function() {
      $location.path('/');
    });
    $rootScope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });
  }]);
