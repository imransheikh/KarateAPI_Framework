function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
    env: env,
    myVarName: 'someValue'

  }
  if (env == 'qa') {
        config.api_base_url = 'https://restful-booker.herokuapp.com'
        token = karate.callSingle('classpath:com/api/booker/scenarios/Reusable/CreateToken.feature', config).API_TOKEN
        config.ApiToken = 'token=' + token
        //karate.callSingle('classpath:com/api/booker/scenarios/Reusable/BookerCommon.feature', config)

  } else if (env == 'dev') {

  }
  karate.configure('headers',{Accept: 'application/json', 'Content-Type': 'application/json', Cookie: config.ApiToken})
  var config = karate.callSingle('classpath:com/api/booker/scenarios/Reusable/BookerCommon.feature', config);
  return config;
}