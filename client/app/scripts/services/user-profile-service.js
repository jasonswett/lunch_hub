'use strict';

angular.module('lunchHubApp')
  .service('UserProfileService', function() {
    this.selectedIds = function(selectedGroups) {
      var ids = [];
      angular.forEach(selectedGroups, function(groupIsSelected, groupId) {
        if (groupIsSelected) {
          ids.push(groupId);
        }
      });
      return ids;
    };
  });
