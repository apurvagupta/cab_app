Feature: Creating a new Admin
  In order to create a new admin
  An Admin
  should be able to submit a new admin

  Background:
    Given User is logged in
    And   Current User is Admin

  Scenario: Admin creates a New Admin
    And   User is on the new admin page
    And   User fills in admin_name as donkey
    And   User fills in admin_contact_no as 1234567890
    When  User creates a new admin
    Then  User should be able to view all admins including this one
    And   User should be able to view edit link for each admin
    And   User should be able to view new link
    And   User should be able to view back link

  Scenario: Admin edits an existing admin
    And   User is on the edit admin page
    And   User changes an admin information
    When  User updates admin information
    And   User should be able to view edit link for each admin
    And   User should be able to view new link
    And   User should be able to view back link




