Feature: Requesting a cab
  In order to book a cab
  A requester
  Should submit a cab request form

  Background:
    Given User is logged in
    And User is on home page

  Scenario: Sends a Cab Request
    And User has its previous requests
    When User Makes a booking
    Then User should be able to view its all requests including this one
    And User should be able to view 'Download XLS sheet' link

  Scenario: Cancels the Cab Request form
    When User cancels the form
    Then the same form with blank fields should be rendered again
