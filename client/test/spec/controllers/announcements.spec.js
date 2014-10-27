'use strict';

describe('AnnouncementsCtrl', function() {
  var announcement;

  beforeEach(function() {
    inject(function($injector) {
      ctrl               = $injector.get('$controller')('AnnouncementsCtrl', { $scope: scope });
      announcement       = { restaurantName: 'Bangkok Taste' };
      scope.announcement = { restaurantName: 'Jason\'s Pizza' };

      $httpBackend.expect('GET', '/api/announcements').respond([announcement]);
    });
  });

  it('sets scope.announcements to an empty array', function() {
    expect(scope.announcements).toEqual([]);
  });

  it('grabs a list of announcements', function() {
    expect(scope.announcements.length).toBe(0);
    $httpBackend.flush();
    expect(scope.announcements.length).toBe(1);
  });

  describe('save', function() {
    var newAnnouncement;

    beforeEach(function() {
      newAnnouncement = { restaurantName: 'Ucello\'s' };
      $httpBackend.expect('POST', '/api/announcements').respond(200, newAnnouncement);
      $httpBackend.expect('GET', '/api/announcements').respond([newAnnouncement]);
      scope.save();
      $httpBackend.flush();
    });

    it('replaces the old announcement with the new one', function() {
      expect(JSON.stringify(scope.announcements)).toEqual(JSON.stringify([newAnnouncement]));
    });

    it('clears the restaurant name', function() {
      expect(scope.announcement.restaurantName).toEqual('');
    });
  });
});
