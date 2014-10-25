'use strict';

angular.module('lunchHubApp')
  .directive('navLi', ['NavService', function(NavService) {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: '/views/directives/nav-li.html',
      link: function($scope, $element, $attributes) {
        $scope.uri = '/' + $attributes.uri;
        $scope.isActive = NavService.isActive;
      },
      scope: {
        uri: '=uri'
      }
    };
  }]);
