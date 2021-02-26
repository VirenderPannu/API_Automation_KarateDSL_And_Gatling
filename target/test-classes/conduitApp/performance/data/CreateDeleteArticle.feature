
Feature: Tests for the articles

        Background: Define Base URL
            * url apiBaseUrl
            * def dataGenerator = Java.type('helpers.DataGenerator') 
            * def randomArticleValues = dataGenerator.getRandomArticleValues()
            * def articleRequestBody = read('classpath:conduitApp/resources/newArticleRequest.json')
            * set articleRequestBody.article.title = __gatling.Title
            * set articleRequestBody.article.description = __gatling.Description
            * set articleRequestBody.article.body = __gatling.Body

            * def sleep = function(ms){ java.lang.Thread.sleep(ms) }
            * def pause = karate.get('__gatling.pause', sleep)

        @regression
        Scenario: Create and Delete article
          * configure headers = { "Authorization": #('Token ' + __gatling.token) }
            ######################################## Add new article ########################################
            Given path 'articles'
              And request articleRequestBody
              * header karate-name = "Create Article - RESULT"
              # * header karate-name = "Create Article - RESULT" + __gatling.Title
             When method Post
             Then status 200
              * def articleId = response.article.slug

              #* pause(5000)
            
            ######################################## Delete the added article ###############################
            Given path 'articles', articleId
            * header karate-name = "Delete Article - RESULT"
            # * header karate-name = "Delete Article - RESULT" + __gatling.Title
             When method Delete
             Then status 200