"use strict";var app=angular.module("lunchHubApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch","rails"]);app.config(["$routeProvider",function(a){a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/groups",{templateUrl:"views/groups.html",controller:"GroupsCtrl"}).otherwise({redirectTo:"/"})}]),app.factory("Group",["railsResourceFactory",function(a){return a({url:"/api/groups",name:"group"})}]),angular.module("lunchHubApp").controller("MainCtrl",["$scope","$routeParams","Group",function(a,b,c){a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"],a.groups=c.query()}]),angular.module("lunchHubApp").controller("GroupsCtrl",["$scope","Group",function(a,b){b.query().then(function(b){a.groups=b}),a.save=function(){new b(a.group).create().then(function(b){a.groups.push(b)})}}]);