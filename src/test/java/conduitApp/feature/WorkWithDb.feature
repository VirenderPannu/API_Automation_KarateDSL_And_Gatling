
Feature: Tests for the SQL Server JDBC connection

        Background:
           * def dbHandler = Java.type('helpers.DbHandler') 

        @JDBC
        Scenario: Set DB with a new job
        * eval dbHandler.addNewJobWithName("QA")

        @JDBC
        Scenario: Get levels for job
        * def level = dbHandler.getMinAndMaxLevelsForJob("QA")
        * print level.minLvl
        * print level.maxLvl