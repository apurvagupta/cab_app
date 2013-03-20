Feature: Authenticating a User
  In order to access the home page
  A user
  Should be able to login

Background:
  Given  User fills in username as pataka
  And    User fills in password as full-jhhadi

Scenario: Requester logs in
  And    Current User is not an Admin
  When   User logs in
  Then   User should be able to view the home page with cab request form
  And    User should be able to view view my report link
  And    User should be able to view contact us link
  And    User should be able to view logout link


Scenario: Admin logs in
  And    Current User is Admin
  When   User logs in
  Then   User should be able to view the home page with cab request form
  And    User should be able to view view my report link
  And    User should be able to view manage app link
  And    User should be able to view logout link
