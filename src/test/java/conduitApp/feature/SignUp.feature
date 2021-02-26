@ignore
Feature: Signup as new user

        Background: Preconditions
            * def dataGenerator = Java.type('helpers.DataGenerator') 
            * def randomEmail = dataGenerator.getRandomEmail()
            * def randomUserName = dataGenerator.getRandomUsername()
            Given url apiBaseUrl

        @debug
        Scenario: Signup as a new user
            * def timeValidator = read('classpath:helpers/timeValidator.js')
            * def jsFunction =
                """
                    function(){
                        var dataGenerator = Java.type('helpers.DataGenerator') 
                        var generator = new dataGenerator
                        return generator.getRandomUser()
                    }
                """ 
            
            * def randomUser = call jsFunction
            * print randomEmail

            #Given def userData = {"email": #(randomEmail), "username": #(randomUserName)}
            Given path 'users'
              And request
              """
                {
                    "user": {
                        "email": #(randomEmail),
                        "password": "12345678",
                        "username": #(randomUser)
                    }
                }
              """
             When method Post
             Then status 200
              And match response ==
              """
                    {
                        "user": {
                            "id": '#number',
                            "email": #(randomEmail),
                            "createdAt": "#? timeValidator(_)",
                            "updatedAt": "#? timeValidator(_)",
                            "username": #(randomUser),
                            "bio": "##string",
                            "image": "##string",
                            "token": "#string"
                        }
                    }
              """
                  
        @parallel=false
        @debug
        Scenario Outline: Signup as a duplicate email and username then verify respective error messages
            Given path 'users'
              And request
              """
                {
                    "user": {
                        "email": "<email>",
                        "password": "<password>",
                        "username": "<username>"
                    }
                }
              """
             When method Post
             Then status 422
              And match response == <errorMessage>

        Examples:
                  | email                    | password | username          | errorMessage                                                                          |
                  | virender.pannu@gmail.com | 12345678 | #(randomUserName) | {"errors":{"email":["has already been taken"]}}                                       |
                  | #(randomEmail)           | 12345678 | veerkarate        | {"errors":{"username":["has already been taken"]}}                                    |
                  | virender.pannu@gmail.com | 12345678 | veerkarate        | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}} |
                  