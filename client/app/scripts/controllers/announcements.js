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
    Announcement.query().then(function(announcements) {
      $scope.announcements = announcements;
    });
  }]);
