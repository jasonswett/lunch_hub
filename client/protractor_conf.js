exports.config = {
  seleniumAddress: 'http://0.0.0.0:4444/wd/hub',
  capabilities: { 'browserName': 'chrome' },
  specs: ['test/e2e/**/*.spec.js'],
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
};
