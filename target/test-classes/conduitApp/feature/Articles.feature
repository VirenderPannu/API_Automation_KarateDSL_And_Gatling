
Feature: Tests for the articles

        Background: Define Base URL
            * url apiBaseUrl
            * def dataGenerator = Java.type('helpers.DataGenerator') 
            * def randomArticleValues = dataGenerator.getRandomArticleValues()
            * def articleRequestBody = read('classpath:conduitApp/resources/newArticleRequest.json')
            * set articleRequestBody.article.title = randomArticleValues.title
            * set articleRequestBody.article.description = randomArticleValues.description
            * set articleRequestBody.article.body = randomArticleValues.body
             ## * def loginResponse = callonce read('classpath:helpers/CreateToken.feature')
             ## * def authToken = loginResponse.userToken

        @regressions
        Scenario: Create an article
            ######################################## Add new article ########################################
            ## Given header Authorization = 'Token ' + authToken
            Given path 'articles'
              And request articleRequestBody
             When method Post
             Then status 200
              And match response.article.title == randomArticleValues.title

        @regression
        Scenario: Create and Delete article
            ######################################## Add new article ########################################
            ## Given header Authorization = 'Token ' + authToken

            Given path 'articles'
              And request { "article": {"tagList": ["#mytag","#blablabla"], "title": #(randomArticleValues.title), "description": #(randomArticleValues.description), "body": #(randomArticleValues.body)} }
             When method Post
             Then status 200
              And match response.article.title == randomArticleValues.title
              * def articleId = response.article.slug

            Given path 'articles'
             When method Get
             Then status 200
              And match response.articles[0].title == randomArticleValues.title
            
            ######################################## Delete the added article ###############################
            ## Given header Authorization = 'Token ' + authToken
            Given path 'articles', articleId
             When method Delete
             Then status 200

            Given path 'articles'
             When method Get
             Then status 200
              And match response.articles[0].title != randomArticleValues.title