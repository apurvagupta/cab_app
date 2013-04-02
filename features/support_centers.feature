Feature: Managing admin/vendor
  In order to manage admin & vendor
  A user
  Should be able to view and update admins/vendors

  Background:
    Given User is logged in

  Scenario: Requester views active admin/vendor
    And   Current User is not an Admin
    And   There are admins and vendors
    And   User is on the support centers page
    Then  User should be able to view active admin & active vendor

  Scenario: Admin updates current admin and vendor
    And    Current User is Admin
    And    There are admins and vendors
    And    User is on the support centers edit page
    And    User selects spider from drop down list admins
    And    User selects bear from drop down list vendors
    When   User updates current admin/vendor
    Then   User should be able to view active admin & active vendor
    And    User should be able to view Admins link
    And    User should be able to view Vendors link
    And    User should be able to view Update link


