'use strict'

var $httpBackend, scope, ctrl;

beforeEach(function() {
  module('lunchHubApp');

  inject(function($injector) {
    $httpBackend = $injector.get('$httpBackend');
    scope = $injector.get('$rootScope').$new();
  });
});
