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
    $scope.updateProfileForm = { name: $auth.user.name }

    $scope.updateProfile = function() {
      $auth.updateAccount($scope.updateProfileForm)
        .then(function(resp) { 
          console.log('yay');
        })
        .catch(function(resp) { 
          console.log('shit.');
        });
    };
  }]);
