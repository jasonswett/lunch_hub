'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UsersCtrl
 * @description
 * # UsersCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UsersCtrl', ['$scope', '$auth', 'Group', 'UserProfileService', function ($scope, $auth, Group, UserProfileService) {
    $scope.updateProfileForm = { name: $auth.user.name };

    Group.query().then(function(groups) {
      $scope.groups = groups;
    });

    $scope.selectedGroups = {};
    $auth.user.group_ids.forEach(function(groupId) {
      $scope.selectedGroups[groupId] = true;
    });

    $scope.updateProfile = function() {
      $scope.updateProfileForm.group_ids = UserProfileService.selectedIds($scope.selectedGroups);

      $auth.updateAccount($scope.updateProfileForm)
        .then(function() { 
          $scope.message = 'Your profile has been updated.';
        });
    };
  }]);
