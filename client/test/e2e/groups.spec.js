describe('E2E: main page', function() {
  var ptor;

  beforeEach(function() {
    ptor = protractor.getInstance();
  });

  it('should load the home page', function() {
    browser.get('/#/groups');

    expect(element.all(by.repeater('group in groups')).count()).toEqual(0);

    var groupName = 'Ben Franklin Labs';
    element(by.model('group.name')).sendKeys(groupName);
    element(by.id('group-save-button')).click();

    expect(element.all(by.repeater('group in groups')).count()).toEqual(1);
  });
});
