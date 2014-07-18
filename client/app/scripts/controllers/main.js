'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('MainCtrl', ['$scope', '$routeParams', 'Group', function ($scope, $routeParams, Group) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    var group = Group.query();
  }]);
