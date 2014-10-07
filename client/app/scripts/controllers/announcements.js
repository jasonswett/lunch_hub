'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:AnnouncementsCtrl
 * @description
 * # AnnouncementsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('AnnouncementsCtrl', ['$scope', 'Announcement', function ($scope, Announcement) {
    $scope.announcements = [];

    Announcement.query().then(function(announcements) {
      $scope.announcements = announcements;
    });

    $scope.save = function() {
      new Announcement($scope.announcement).create().then(function(announcement) {
        $scope.announcement.restaurantName = '';
        $scope.announcements.push(announcement);
      });
    };
  }]);
