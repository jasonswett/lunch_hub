'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UsersCtrl
 * @description
 * # UsersCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UsersCtrl', ['$scope', '$auth', function ($scope, $auth) {
    $scope.updateProfileForm = { name: $auth.user.name };

    $scope.updateProfile = function() {
      $auth.updateAccount($scope.updateProfileForm)
        .then(function(resp) { 
          $scope.message = 'Your profile has been updated.';
        })
        .catch(function(resp) { 
        });
    };
  }]);
