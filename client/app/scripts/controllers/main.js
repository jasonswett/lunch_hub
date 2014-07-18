'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
