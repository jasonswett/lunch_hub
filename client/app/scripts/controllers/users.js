'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UsersCtrl
 * @description
 * # UsersCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UsersCtrl', ['$scope', '$auth', 'Group', function ($scope, $auth, Group) {
    var selectedIds = function(selectedGroups) {
      var ids = [];
      angular.forEach(selectedGroups, function(groupIsSelected, groupId) {
        if (groupIsSelected) {
          ids.push(groupId);
        }
      });
      return ids;
    };

    $scope.updateProfileForm = { name: $auth.user.name };

    Group.query().then(function(groups) {
      $scope.groups = groups;
      $scope.selectedGroups = {};
    });

    $scope.updateProfile = function() {
      $scope.updateProfileForm['group_ids'] = selectedIds($scope.selectedGroups);

      $auth.updateAccount($scope.updateProfileForm)
        .then(function() { 
          $scope.message = 'Your profile has been updated.';
        });
    };
  }]);
