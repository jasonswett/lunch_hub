'use strict';

angular.module('lunchHubApp')
  .directive('error', function() {
    return {
      restrict: 'E',
      templateUrl: 'views/directives/error.html'
    };
  });
