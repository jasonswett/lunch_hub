'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:HeaderCtrl
 * @description
 * # HeaderCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('HeaderCtrl', ['$scope', 'NavService', function ($scope, NavService) {
    $scope.isActive = NavService.isActive;
  }]);
