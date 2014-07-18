'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
