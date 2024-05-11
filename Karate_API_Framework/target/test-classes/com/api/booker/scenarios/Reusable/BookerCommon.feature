Feature: We have called all the common feature and then use
  config.js so it would be available for all

  Background:
    * def utils = Java.type('com.api.booker.utils.JavaHelper')


  Scenario: Getting all the common functions
    * karate.log("Calling common function")