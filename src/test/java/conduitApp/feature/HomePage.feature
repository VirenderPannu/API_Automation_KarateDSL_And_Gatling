
Feature: Tests for the home page

        Background: Define Base URL
            Given url apiBaseUrl

        @smoke
        Scenario: Get all tags
            Given path 'tags'
             When method Get
             Then status 200
              And match response.tags == '#array'
              And match each response.tags == '#string'
              And match response.tags contains ['dragons', 'Gandhi', '\u200C']
              And match response.tags contains any ['veer' , 'singh', 'dragons']
              # And match response.tags contains only ['dragons']
              And match response.tags !contains ['Dragons', 'gandhi']

        @smoke
        Scenario: Get 10 articles from the page
            * def timeValidator = read('classpath:helpers/timeValidator.js')

            Given path 'articles'
            Given params {limit: 10 , offset: 0}
             When method Get
             Then status 200
              And match response.articles == '#array'
              And match response.articles == '#[10]'
              And match each response.articles == '#object'
              And match response.articlesCount == 500
              And match response == {"articles": "#array" , "articlesCount": 500}
              And match response.articles[0].createdAt contains '2020'
              And match response.articles[*].favoritesCount !contains 2
              And match response..bio contains null
              And match each response..following == false
              And match each response..following == '#boolean'
              And match each response..favoritesCount == '#number'
              And match each response..bio == '##string'
              And match each response.articles ==
              """
                  {
                        "title": "#string",
                        "slug": "#string",
                        "body": "#string",
                        "createdAt": "#? timeValidator(_)",
                        "updatedAt": "#? timeValidator(_)",
                        "tagList": "#array",
                        "description": "#string",
                        "author": {
                            "username": "#string",
                            "bio": "##string",
                            "image": "#string",
                            "following": '#boolean'
                        },
                        "favorited": '#boolean',
                        "favoritesCount": '#number'
                  }
              """

        @conditional
        Scenario: Conditional logic
            Given path 'articles'
            Given params {limit: 10 , offset: 0}
             When method Get
             Then status 200
             * def favoritesCount = response.articles[0].favoritesCount
             * def article = response.articles[0]

             #* if (favoritesCount == 0) karate.call('classpath:helpers/AddLikes.feature', article)

             * def fCount = favoritesCount == 0 ? karate.call('classpath:helpers/AddLikes.feature', article).likesCount : favoritesCount

            Given path 'articles'
            Given params {limit: 10 , offset: 0}
             When method Get
             Then status 200
              And match response.articles[0].favoritesCount == fCount

        @retrycall
        Scenario: Retry call
            * configure retry = { count:10 , interval:5000}

            Given path 'articles'
            Given params {limit: 10 , offset: 0}
              And retry until response.articles[0].favoritesCount == 1
             When method Get
             Then status 200

        @sleepcall
        Scenario: Sleep call
            * def sleep = function(pause){ java.lang.Thread.sleep(pause) }

            Given path 'articles'
            Given params {limit: 10 , offset: 0}
              * eval sleep(5000);
             When method Get
             Then status 200
