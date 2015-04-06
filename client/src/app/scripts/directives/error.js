'use strict';

angular.module('lunchHubApp')
  .directive('error', function() {
    return {
      restrict: 'E',
      templateUrl: 'app/views/directives/error.html'
    };
  });
