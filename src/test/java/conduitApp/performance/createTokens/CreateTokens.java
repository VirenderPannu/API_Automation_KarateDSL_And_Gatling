package conduitApp.performance.createTokens;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import com.intuit.karate.Runner;

public class CreateTokens {

    private static final List<String> tokens = new ArrayList<>();
    private static final AtomicInteger counter = new AtomicInteger();

    private static String[] emails = {
        "coursedemo1@test.com",
        "coursedemo2@test.com",
        "coursedemo3@test.com",
        "coursedemo4@test.com",
        "coursedemo5@test.com"
    };

    public static String getNextToken(){
        return tokens.get(counter.getAndIncrement() % tokens.size());
    }

    public static void createAccessTokens(){
        for(String email: emails){
            Map<String, Object> account = new HashMap<>();
            account.put("userEmail", email);
            account.put("userPassword", "coursedemo");
            Map<String, Object> result = Runner.runFeature("classpath:helpers/CreateToken.feature", account, true);
            System.out.println("results = " + result.get("userToken").toString());
            tokens.add(result.get("userToken").toString());
            System.out.println("tokens = " + tokens);
        }
    }
    
}
