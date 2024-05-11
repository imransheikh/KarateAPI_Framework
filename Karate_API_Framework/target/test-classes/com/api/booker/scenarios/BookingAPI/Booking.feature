Feature: In order to perform regression testing
  As a user validate the booking api status code
  and response.


  Background:
    * url api_base_url
    * def booking = '/booking'
    * def bookingWithExtraSlash = '/booking/'
    * def bookingId = 1687


  Scenario: Verify that user can get all booking id's
#    * def randomNumber = utils.getRandomAlphanumericString(4)
#    * karate.log("#####################")
#    * karate.log(randomNumber)
     Given path booking
    When method get
    * karate.log(response)
    Then status 200


  Scenario Outline: Verify user can create booking
    Given path booking
    When request {"firstname" : "<First_Name>","lastname" : "<Last_Name>","totalprice" : 111,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}
    When method post
    * karate.log(response)
    Then status 200
    * def bookingId = response.bookingid
    * karate.call('classpath:com/api/booker/scenarios/BookingAPI/BookingReusable.feature@Delete_Booking_Reusable').bookingId


    Examples:
      | First_Name | Last_Name |
      | Imran      | Sheikh    |


  Scenario Outline:  Verify user can update booking
    * def bookingId = karate.call('classpath:com/api/booker/scenarios/BookingAPI/BookingReusable.feature@Create_Booking_Reusable').fetchBookingId
    * karate.log("After using")
    * karate.log(bookingId)
    Given path bookingWithExtraSlash+bookingId
    When request {"firstname" : "<First_Name>","lastname" : "<Last_Name>","totalprice" : 111,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}
    When method put
    * karate.log(response)
    Then status 200
    * karate.call('classpath:com/api/booker/scenarios/BookingAPI/BookingReusable.feature@Delete_Booking_Reusable').bookingId

    Examples:
      | First_Name | Last_Name |
      | Imran      | Khan      |


  Scenario Outline: Verify that user can get booking by user's first and last name
    * def bookingId = karate.call('classpath:com/api/booker/scenarios/BookingAPI/BookingReusable.feature@Create_Booking_Reusable').fetchBookingId
    Given path booking
    * param firstname = "<First_Name>"
    * param lastname = "<Last_Name>"
    When method get
    Then status 200
    * karate.call('classpath:com/api/booker/scenarios/BookingAPI/BookingReusable.feature@Delete_Booking_Reusable').bookingId

    Examples:
      | First_Name | Last_Name |
      | Imran      | Sheikh    |
