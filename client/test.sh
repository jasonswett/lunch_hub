# Before running this, run node_modules/protractor/bin/webdriver-manager start.

# Clean the test database.
rake db:reset RAILS_ENV=test

# Run Protractor.
node_modules/protractor/bin/protractor protractor_conf.js
