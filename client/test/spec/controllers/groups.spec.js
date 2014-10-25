'use strict';

describe('GroupsCtrl', function() {
  var $httpBackend,
      scope,
      ctrl,
      group;

  beforeEach(function() {
    module('lunchHubApp');

    inject(function($injector) {
      $httpBackend       = $injector.get('$httpBackend');
      scope              = $injector.get('$rootScope').$new();
      ctrl               = $injector.get('$controller')('GroupsCtrl', { $scope: scope });
      group              = { name: 'Jason\'s Group' };

      $httpBackend.expect('GET', '/api/groups').respond([group]);
    });
  });

  it('sets scope.groups to an empty array', function() {
    expect(scope.groups).toEqual([]);
  });

  it('grabs a list of groups', function() {
    expect(scope.groups.length).toBe(0);
    $httpBackend.flush();
    expect(scope.groups.length).toBe(1);
  });

  describe('save', function() {
    beforeEach(function() {
      $httpBackend.expect('POST', '/api/groups').respond(200, { name: 'Foo' });
      scope.save();
      $httpBackend.flush();
    });

    it('adds a group', function() {
      expect(scope.groups.length).toBe(2);
    });
  });
});
