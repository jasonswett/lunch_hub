'use strict';

describe('UsersCtrl', function() {
  var auth;

  beforeEach(function() {
    inject(function($injector) {
      auth = $injector.get('$auth');
      auth.user = { group_ids: [] };
      ctrl = $injector.get('$controller')('UsersCtrl', { $scope: scope, $auth: auth });
    });
  });

  describe('updateProfile', function() {
    it('sets group ids', function() {
      scope.selectedGroups = {
        5: true,
        8: true
      };
      scope.updateProfile();
      expect(scope.updateProfileForm.group_ids).toEqual(['5', '8']);
    });
  });
});
