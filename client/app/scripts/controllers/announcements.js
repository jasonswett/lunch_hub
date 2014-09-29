'use strict';

/**
 * @ngdoc function
 * @name lunchHubApp.controller:AnnouncementsCtrl
 * @description
 * # AnnouncementsCtrl
 * Controller of the lunchHubApp
 */
angular.module('lunchHubApp')
  .controller('AnnouncementsCtrl', ['$scope', 'Announcement', '$auth', function ($scope, Announcement, $auth) {
    Announcement.query().then(function(announcements) {
      $scope.announcements = announcements;
    });

    /*
    $auth.validateUser().then(function(resp) {
      console.log(resp);
    });
    */

    $scope.save = function() {
      new Announcement($scope.announcement).create().then(function(announcement) {
        $scope.announcements.push(announcement);
      });
    };
  }]);
