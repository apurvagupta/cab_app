Feature: Creating a new Admin
  In order to create a new admin
  An Admin
  should be able to submit a new admin

  Background: Admin is logged in

  Scenario: Create New Admin
    And   Admin is on "new admin" page
    And   Admin fills admin information
    When  Admin creates a new admin
    Then  Admin should be able to view all admins including this one
    And   Admin should be able to view 'edit' link for each admin
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link

  Scenario: Edit an existing admin
    And   Admin is on 'edit admin' page
    And   Admin changes a admin information
    When  Admin updates admin information
    Then  Admin should be able to view all admins including this one
    And   Admin should be able to view 'edit' link for each admin
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link




