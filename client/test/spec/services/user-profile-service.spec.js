'use strict';

describe('UserProfileService', function() {
  var UserProfileService;

  beforeEach(function() {
    inject(function($injector) {
      UserProfileService = $injector.get('UserProfileService');
    });
  });

  describe('updateProfile', function() {
    it('sets group ids', function() {
      var selectedGroups = {
        '3': true,
        '5': true,
        '7': false
      };
      expect(UserProfileService.selectedIds(selectedGroups)).toEqual(['3', '5']);
    });
  });
});
