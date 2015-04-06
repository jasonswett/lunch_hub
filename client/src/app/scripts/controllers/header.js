'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:HeaderCtrl
 * @description
 * # HeaderCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('HeaderCtrl', function ($scope, $location) {
    $scope.isActive = function(viewLocation) {
      return viewLocation === $location.path();
    };
  });
