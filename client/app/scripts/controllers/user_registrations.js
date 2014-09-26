'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UserRegistrationsCtrl
 * @description
 * # UserRegistrationsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UserRegistrationsCtrl', ['$scope', '$rootScope', '$location', function ($scope, $rootScope, $location) {
    $rootScope.$on('auth:registration-email-success', function() {
      $location.path('/');
    });
  }]);
