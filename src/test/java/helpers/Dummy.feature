Feature: Dummy

        Scenario: Dummy Scenario
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * def username = dataGenerator.getRandomUsername()
        * print 'inside dummy  ' + username