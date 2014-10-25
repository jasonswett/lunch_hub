'use strict';

describe('AnnouncementsCtrl', function() {
  var $httpBackend,
      announcement,
      scope,
      ctrl;

  beforeEach(function() {
    module('lunchHubApp');

    inject(function($injector) {
      $httpBackend       = $injector.get('$httpBackend');
      scope              = $injector.get('$rootScope').$new();
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
    beforeEach(function() {
      $httpBackend.expect('POST', '/api/announcements').respond(200, { restaurantName: 'Foo' });
      scope.save();
      $httpBackend.flush();
    });

    it('adds an announcement', function() {
      expect(scope.announcements.length).toBe(2);
    });

    it('clears the restaurant name', function() {
      expect(scope.announcement.restaurantName).toEqual('');
    });
  });
});
