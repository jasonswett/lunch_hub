'use strict';

angular.module('lunchHubApp')
  .directive('focusOnLoad', function() {
    return {
      link: function($scope, $element) {
        $element.focus();
      }
    };
  });
