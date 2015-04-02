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
    $scope.refreshAnnouncements = function() {
      Announcement.query().then(function(announcements) {
        $scope.announcements = announcements;
      });
    };

    $scope.save = function() {
      new Announcement($scope.announcement).create().then(function() {
        $scope.announcement.restaurantName = '';
        $scope.refreshAnnouncements();
      });
    };

    $scope.announcements = [];
    $scope.refreshAnnouncements();
  }]);
