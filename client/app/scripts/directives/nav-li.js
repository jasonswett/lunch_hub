'use strict';

angular.module('lunchHubApp')
  .directive('navLi', ['NavService', function(NavService) {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: '/views/directives/nav-li.html',
      link: function($scope, $element, $attributes) {
        $scope.href = '/' + $attributes.href;
        $scope.isActive = NavService.isActive;
      },
      scope: {
        href: '=href'
      }
    };
  }]);
