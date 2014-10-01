'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UserSessionsCtrl', ['$scope', function ($scope) {
    $scope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });
  }]);
