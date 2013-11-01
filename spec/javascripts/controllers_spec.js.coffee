describe "Lunch Hub controllers", ->
  beforeEach module("lunchHub")

  describe "GroupIndexCtrl", ->
    it "should set groups to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("GroupIndexCtrl",
        $scope: scope
      )
      expect(scope.groups.length).toBe 0
    )
