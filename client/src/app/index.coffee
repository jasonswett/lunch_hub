'use strict'

angular.module('lunchHubApp', [
  'ngAnimate'
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
  'rails'
  'ng-token-auth'
]).config([
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode true
    $routeProvider.when('/',
      templateUrl: 'app/views/main.html'
      controller: 'MainCtrl'
      isPublic: true).when('/today',
      templateUrl: 'app/views/announcements.html'
      controller: 'AnnouncementsCtrl'
      resolve: auth: [
        '$auth'
        ($auth) ->
          $auth.validateUser()
      ]).when('/profile',
      templateUrl: 'app/views/users/edit.html'
      controller: 'UsersCtrl'
      resolve: auth: [
        '$auth'
        ($auth) ->
          $auth.validateUser()
      ]).when('/groups',
      templateUrl: 'app/views/groups.html'
      controller: 'GroupsCtrl').when('/sign_in',
      templateUrl: 'app/views/user-sessions/new.html'
      controller: 'UserSessionsCtrl'
      isPublic: true).when('/sign_up',
      templateUrl: 'app/views/user-registrations/new.html'
      controller: 'UserRegistrationsCtrl'
      isPublic: true).otherwise redirectTo: '/'
    return
]).config([
  '$authProvider'
  ($authProvider) ->
    $authProvider.configure apiUrl: '/api'
    return
]).factory('Announcement', [
  'railsResourceFactory'
  (railsResourceFactory) ->
    railsResourceFactory
      url: '/api/announcements'
      name: 'announcement'
]).factory('Group', [
  'railsResourceFactory'
  (railsResourceFactory) ->
    railsResourceFactory
      url: '/api/groups'
      name: 'group'
]).run [
  '$rootScope'
  '$auth'
  '$location'
  ($rootScope, $auth, $location) ->
    $rootScope.$on 'auth:login-success', ->
      $location.path '/today'
      return
    $rootScope.$on 'auth:logout-success', ->
      $location.path '/sign_in'
      return
    $rootScope.$on '$routeChangeStart', (event, next) ->
      $auth.validateUser().then (->
        if $location.path() == '/'
          $location.path '/today'
        return
      ), ->
        if !next.isPublic
          $location.path '/sign_in'
        return
      return
    return
]
