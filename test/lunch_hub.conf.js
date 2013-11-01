module.exports = function(config) {
  config.set({
    basePath: '..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    },

    files: [
      'app/assets/javascripts/angular.js',
      'app/assets/javascripts/angular-mocks.js',
      'app/assets/javascripts/main.js.coffee',
      'app/assets/javascripts/angular/controllers/GroupIndexCtrl.js.coffee',
      'app/assets/javascripts/angular/*',
      'test/*_spec.js.coffee' 
    ]
  });
};
