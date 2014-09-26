'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:UserRegistrationsCtrl
 * @description
 * # UserRegistrationsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('UserRegistrationsCtrl', ['$scope', '$rootScope', '$location', '$auth', function ($scope, $rootScope, $location, $auth) {
    $rootScope.$on('auth:registration-email-success', function() {
      $location.path('/today');
    });
    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function() { 
          $auth.submitLogin({
            email: $scope.registrationForm.email,
            password: $scope.registrationForm.password
          });
        });
    };
  }]);
