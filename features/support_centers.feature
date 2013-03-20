Feature: Managing admin/vendor
  In order to manage admin & vendor
  A user
  Should be able to view and update admins/vendors

  Background:
    Given User is logged in


  Scenario: Requester views active admin/vendor
    And   Current User is not an Admin
    And   User is on the support centers page
    Then  User should be able to view active admin & active vendor

  Scenario: Admin updates current admin and vendor
    And    Current User is Admin
    And    User is on the support centers edit page
    And    User changes current admin/vendor
    When   User updates current admin/vendor
    Then   User should be able to view active admin & active vendor
    And    User should be able to view admins link
    And    User should be able to view vendors link
    And    User should be able to view update link
