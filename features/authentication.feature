Feature: User visits the home page
  In order to access the home page
  A user
  Should be able to see the home page of cab_app

Background:
  Given  User is logged in


Scenario: Requester logs in
  And    Current User is not an Admin
  And    User is on the home page
  Then   User should be able to view 'cab request' form
  And    User should be able to view 'View My Requests' link
  And    User should be able to view 'Contact Us' link
  And    User should be able to view 'Log Out' link


Scenario: Admin logs in
  And    Current User is Admin
  And    User is on the home page
  Then   User should be able to view 'cab request' form
  And    User should be able to view 'View My Requests' link
  And    User should be able to view 'Manage App' link
  And    User should be able to view 'View All Reports' link
  And    User should be able to view 'Log Out' link

