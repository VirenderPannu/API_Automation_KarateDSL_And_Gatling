@parallel=false
@hooks
Feature: Hooks

        Background: Hooks for scenarios
        # before hooks
        * def result = callonce read('classpath:helpers/dummy.feature')
        * def username = result.username
        # after hooks with inline JS function
        * configure afterScenario = function(){ karate.call('classpath:helpers/dummy.feature') }
        # after hooks with embedded expression for JS function
        * configure afterFeature = 
        """
            function(){
                karate.log('Lets do it after every feature file');
            }
        """

        Scenario: First Scenario
        * print username
        * print 'This is first scenario'


        Scenario: Second Scenario
        * print username
        * print 'This is second scenario'