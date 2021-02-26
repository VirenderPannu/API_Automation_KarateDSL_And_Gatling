# API_Automation_KarateDSL_And_Gatling

Framework Used: Karate DSL framework with JUnit5

  BDD Cucumber / gherkin with Java

  Cucumber reporting
    
  Provides Native JSON support     
    
  Very powerful JSON assertions - schema validations
    
  Provides Multi thread parallel execution


Execution:

  To execute all test scripts in default sequential mode
    
  $ mvn test
    
  To execute all test scripts in default sequential mode having tags = regression
    
  $ mvn test -Dkarate.options="--tags @regression"
    
  To execute all test scripts in default sequential mode with runner name = TestSuiteInSequential
    
  $ mvn clean test -Dtest=TestSuiteInSequential
    
  To execute all test scripts in parallel mode with runner name = ExecuteTestSuiteInParallel
    
  $ mvn clean test -Dtest=ExecuteTestSuiteInParallel
    
  To execute all test scripts in sequential or parallel mode for environment = stage and tags = regression
    
  $ mvn test -Dkarate.env="stage" -Dkarate.options="--tags @regressions"
    
  To execute all test scripts in sequential or parallel mode for environment = stage and tags = regression and runner = ExecuteTestSuiteInParallel
    
  $ mvn test -Dkarate.env="test" -Dtest=ExecuteTestSuiteInParallel -Dkarate.options="--tags @regression"
