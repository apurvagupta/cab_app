Feature: Managing admin/vendor
  In order to manage admin & vendor
  A user
  Should be able to view and update admins/vendors

  Background:
    Given User is logged in
    And   User is on support centers page

  Scenario: Requester logs in
    Then  User should be able to view active admin & active vendor

  Scenario: Admin logs in
    Then  User should be able to view active admin & active vendor
    And   User should be able to view admins link
    And   User should be able to view vendors link
    And   User should be able to view update link