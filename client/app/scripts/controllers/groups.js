'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:GroupsCtrl
 * @description
 * # GroupsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('GroupsCtrl', ['$scope', '$routeParams', 'Group', function ($scope, $routeParams, Group) {
    $scope.groups = Group.query();
  }]);
