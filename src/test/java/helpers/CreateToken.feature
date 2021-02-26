
Feature: Create Global Token

        Scenario: Create Token
            Given url apiBaseUrl
            Given path 'users/login'
              And request { "user": {"email": "#(userEmail)", "password": "#(userPassword)"} }
             When method Post
             Then status 200
             * def userToken = response.user.token