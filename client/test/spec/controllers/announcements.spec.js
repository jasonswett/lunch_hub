'use strict';

describe('AnnouncementsCtrl', function() {
  beforeEach(module('lunchHubApp', 'ng-token-auth'));

  it('sets scope.announcements to an empty array', inject(function($controller, $rootScope) {
    var scope = $rootScope.$new(),
        ctrl = $controller('AnnouncementsCtrl', { $scope: scope });

    expect(scope.announcements).toEqual([]);
  }));
});
