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

    // Get a list of all the groups.
    Group.query().then(function(groups) {
      $scope.groups = groups;
    });

    // Get the groups of which the current user is a member.
    $scope.selectedGroups = {};
    $auth.user.group_ids.forEach(function(groupId) {
      $scope.selectedGroups[groupId] = true;
    });

    // This function saves the user profile.
    $scope.updateProfile = function() {
      $scope.updateProfileForm.group_ids = UserProfileService.selectedIds($scope.selectedGroups);

      $auth.updateAccount($scope.updateProfileForm)
        .then(function() { 
          $scope.message = 'Your profile has been updated.';
        });
    };
  }]);
