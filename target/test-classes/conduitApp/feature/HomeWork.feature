
Feature: Home Work

        Background: Preconditions
        * url apiBaseUrl 
        * def timeValidator = read('classpath:helpers/timeValidator.js')

        @parallel=false
        @testing
        Scenario: Favorite articles
        # Step 1: Get atricles of the global feed
            Given path 'articles'
            Given params {limit: 10 , offset: 0}
             When method Get
             Then status 200
        # Step 2: Get the favorites count and slug ID for the first article, save it to variables
            * def favoritesCount = response.articles[0].favoritesCount
            * print favoritesCount
            * def articleId = response.articles[0].slug
        # Step 3: Make POST request to increse favorites count for the first article
            Given path 'articles', articleId , 'favorite'
              And request {}
             When method Post
        # Step 4: Verify response schema
        # Step 5: Verify that favorites article incremented by 1
        * def increasedFavoritesCount = favoritesCount+1
        * print increasedFavoritesCount
              And match response ==
        """
            {
                "article": {
                    "title": "#string",
                    "slug": #(articleId),
                    "body": "#string",
                    "createdAt": "#? timeValidator(_)",
                    "updatedAt": "#? timeValidator(_)",
                    "tagList": '#array',
                    "description": "#string",
                    "author": {
                        "username": "#string",
                        "bio": "##string",
                        "image": "##string",
                        "following": '#boolean'
                    },
                    "favorited": '#boolean',
                    "favoritesCount": #(increasedFavoritesCount)
                }
            }
        """
        # Step 6: Get all favorite articles
            Given path 'users/login'
              And request { "user": {"email": "#(userEmail)", "password": "#(userPassword)"} }
             When method Post
             Then status 200
             * def favorited = response.user.username
             * print favorited
            
            Given path 'articles'
            Given params {favorited: #(favorited), limit: 10 , offset: 0}
             When method Get
             Then status 200
             # Step 7: Verify response schema
             # Step 8: Verify that slug ID from Step 2 exist in one of the favorite articles
              And match response.articles[0].slug == articleId
              And match each response.articles ==
             """
                    {
                        "title": "#string",
                        "slug": "#string",
                        "body": "#string",
                        "createdAt": "#? timeValidator(_)",
                        "updatedAt": "#? timeValidator(_)",
                        "tagList": '#array',
                        "description": "#string",
                        "author": {
                            "username": "#string",
                            "bio": "##string",
                            "image": "##string",
                            "following": '#boolean'
                        },
                        "favorited": '#boolean',
                        "favoritesCount": '#number'
                    }
             """
        @testing
        Scenario: Comment articles
        # Step 1: Get atricles of the global feed
            Given path 'articles'
            Given params {limit: 10 , offset: 0}
             When method Get
             Then status 200
        # Step 2: Get the slug ID for the first article, save it to variable
        * def articleId = response.articles[0].slug
        # Step 3: Make a GET call to 'comments' end-point to get all comments
            Given path 'articles', articleId , 'comments'
             When method Get
             Then status 200
             * print articleId
        # Step 4: Verify response schema
              And match each response.comments ==
              """
                  {
                    "id": '#number',
                    "createdAt": "#? timeValidator(_)",
                    "updatedAt": "#? timeValidator(_)",
                    "body": "#string",
                    "author": {
                        "username": "#string",
                        "bio": "##string",
                        "image": "##string",
                        "following": '#boolean'
                    }
                }
              """
        # Step 5: Get the count of the comments array lentgh and save to variable
            * def commentsCount = response.comments.length
            * print commentsCount
        # Step 6: Make a POST request to publish a new comment
            Given path 'articles', articleId , 'comments'
              And request { "comment": { "body": "Test comment" } }
             When method Post
             Then status 200
             * def addedCommentId = response.comment.id
        # Step 7: Verify response schema that should contain posted comment text
              And match response ==
        """
            {
                "comment": {
                    "id": '#number',
                    "createdAt": "#? timeValidator(_)",
                    "updatedAt": "#? timeValidator(_)",
                    "body": "Test comment",
                    "author": {
                        "username": "#string",
                        "bio": "##string",
                        "image": "#string",
                        "following": '#boolean'
                    }
                }
            }
        """
        # Step 8: Get the list of all comments for this article one more time
            Given path 'users/login'
              And request { "user": {"email": "#(userEmail)", "password": "#(userPassword)"} }
             When method Post
             Then status 200
            Given path 'articles', articleId , 'comments'
             When method Get
             Then status 200
        # Step 9: Verify number of comments increased by 1 (similar like we did with favorite counts)
        * def increasedCommentsCount = commentsCount+1
        * def actualIncreasedCommentCount = response.comments.length
              And match actualIncreasedCommentCount == increasedCommentsCount
        # Step 10: Make a DELETE request to delete comment
            Given path 'articles', articleId, 'comments', addedCommentId
             When method Delete
             Then status 200
        # Step 11: Get all comments again and verify number of comments decreased by 1
            Given path 'articles', articleId , 'comments'
             When method Get
             Then status 200
            * def currentCommentsCount = response.comments.length
              And match currentCommentsCount == commentsCount