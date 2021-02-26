function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

    if (!env) {
      env = 'test';
    }

    var config = {
    apiBaseUrl: 'https://conduit.productionready.io/api/'
    }

    if (env == 'test') {
      config.userEmail = 'coursedemo1@test.com'
      config.userPassword = 'coursedemo'
    } else if (env == 'stage') {
      config.userEmail = 'coursedemo2@test.com'
      config.userPassword = 'coursedemo'
    }

  // Before everything (or 'globally' once) - before suite
  var authToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).userToken
  // Before every Scenario - before method
  karate.configure('headers', {Authorization : 'Token ' + authToken})

  return config;
}