package conduitApp;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

@KarateOptions ( tags = {"@smoke, @regression", "~@debug"} )
class ConduitTest {
    
    // this will run all *.feature files that exist in sub-directories
    // see https://github.com/intuit/karate#naming-conventions   
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    // @Karate.Test
    // Karate testSmoke() {
    //     return Karate.run().tags("@smoke").relativeTo(getClass());
    // }

    // @Karate.Test
    // Karate testRegression() {
    //     return Karate.run().tags("@regression").relativeTo(getClass());
    // }
    
}
