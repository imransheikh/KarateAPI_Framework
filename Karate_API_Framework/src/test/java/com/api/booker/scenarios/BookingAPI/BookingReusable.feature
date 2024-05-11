Feature: User created this feature file to get use
  in other feature file as reusable

  Background:
    * url api_base_url
    * def booking = '/booking'
    * def bookingWithExtraSlash = '/booking/'

  @Reusable
  @Create_Booking_Reusable
  Scenario Outline:[Reuse] Verify user can create booking
    Given path booking
    When request {"firstname" : "<First_Name>","lastname" : "<Last_Name>","totalprice" : 111,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}
    When method post
    * karate.log(response)
    Then status 200
    * def fetchBookingId = response.bookingid
    * karate.log(fetchBookingId)

    Examples:
      | First_Name | Last_Name |
      | Imran      | Sheikh    |

  @Reusable
  @Delete_Booking_Reusable
  Scenario:[Reuse] Verify user can delete booking
    Given path bookingWithExtraSlash+ bookingId
     When method delete
    * karate.log(response)
    Then status 201
