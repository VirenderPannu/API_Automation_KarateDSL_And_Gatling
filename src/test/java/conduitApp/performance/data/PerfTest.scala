package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

import conduitApp.performance.createTokens.CreateTokens

class PerfTest extends Simulation {

    CreateTokens.createAccessTokens()

    val httpProtocol = karateProtocol(
       "/api/articles/{articleId}" -> Nil
//     "/cats/{id}" -> Nil,
//     "/cats" -> pauseFor("get" -> 15, "post" -> 25)
     )

    httpProtocol.nameResolver = (req, ctx) => req.getHeader("karate-name") // for clean reports

    val csvFeeder = csv("articles.csv").circular // provides feeds
    val tokenFeeder = Iterator.continually(Map("token" -> CreateTokens.getNextToken))

    val createDeleteArticle = scenario("Create and delete article")
        .feed(csvFeeder)
        .feed(tokenFeeder)
        .exec(karateFeature("classpath:conduitApp/performance/data/CreateDeleteArticle.feature"))
        //val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

    setUp(
      createDeleteArticle.inject(
            nothingFor(0 seconds),
            atOnceUsers(5),
            rampUsers(5) during (10 seconds), 
            //constantUsersPerSec(10) during (5 seconds), 
            //constantUsersPerSec(20) during (5 seconds) randomized, 
            rampUsersPerSec(2) to 10 during (1 minutes), 
            //rampUsersPerSec(10) to 20 during (1 minutes) randomized, 
            //heavisideUsers(1000) during (20 seconds) 
          ).protocols(httpProtocol)
    )

    // setUp(
    //     createDeleteArticle.inject(
    //         constantConcurrentUsers(5) during (10 seconds),
    //         rampConcurrentUsers(1) to (10) during (10 seconds)
    //     ).protocols(httpProtocol)
    // )
}
