Feature: This is reusable functionality, to generate authentication code
  and use in other api end points

  Background:
    * url api_base_url
    * def authenticationPath = '/auth'

   @Reusable
  Scenario Outline:  User Generate Authentication code
    Given path authenticationPath
    When request {"username" : "<User_Name>", "password" : "<Password>"}
    When method post
    * karate.log("Response: " + response.token)
    Then match response.token == '#notnull'
    * def API_TOKEN = response.token
    Then status 200

    Examples:
      | User_Name | Password    |
      | admin     | password123 |