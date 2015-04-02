'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:GroupsCtrl
 * @description
 * # GroupsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('GroupsCtrl', ['$scope', 'Group', function ($scope, Group) {
    $scope.groups = [];

    Group.query().then(function(groups) {
      $scope.groups = groups;
    });

    $scope.save = function() {
      new Group($scope.group).create().then(function(group) {
        $scope.groups.push(group);
      });
    };
  }]);
