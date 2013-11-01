describe "Lunch Hub controllers", ->
  beforeEach module("lunchHub")

  describe "GroupIndexCtrl", ->
    it "should do some stuff", inject(($controller) ->
      scope = {}
      ctrl = $controller("GroupIndexCtrl",
        $scope: scope
      )
      expect(scope.groups.length).toBe 0
    )
