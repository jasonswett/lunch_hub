'use strict';

angular.module('lunchHubApp')
  .controller('UserRegistrationsCtrl', ['$scope', '$location', '$auth', function ($scope, $location, $auth) {
    $scope.$on('auth:registration-email-success', function() {
      $location.path('/today');
    });
    $scope.$on('auth:registration-email-error', function(ev, reason) {
      $scope.error = reason.errors[reason.errors.length - 1];
    });
    $scope.register = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function() { 
          $auth.submitLogin({
            email: $scope.registrationForm.email,
            password: $scope.registrationForm.password
          });
        });
    };
  }]);
