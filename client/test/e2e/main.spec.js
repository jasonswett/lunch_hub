describe('E2E: main page', function() {
  var ptor;

  beforeEach(function() {
    browser.get('http://127.0.0.1:9000/');
    ptor = protractor.getInstance();
  });

  it('should load the home page', function() {
    var ele = by.id('home-header');
    expect(ptor.isElementPresent(ele)).toBe(true);
  });
});
