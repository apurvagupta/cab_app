Feature: Authenticating a User
  In order to access the home page
  A user
  Should be able to login

Background:
  Given User fills in "username" as "pataka"
  And User fills in "password" as "full-jhhadi"

Scenario: Requester logs in
  When User logs in
  Then User should be able to view the home page with "cab request" form
  And User should be able to view the home page with "view my report" link
  And User should be able to view the home page with "contact us" link
  And User should be able to view the home page with "logout" link


Scenario: Admin logs in
  When User logs in
  Then User should be able to view the home page with "cab request" form
  And User should be able to view the home page with "view my report" link
  And User should be able to view the home page with "manage app" link
  And User should be able to view the home page with "logout" link
