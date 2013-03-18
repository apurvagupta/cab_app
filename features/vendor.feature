#Feature: View all vendors
#  In order to view the details of all the vendors
#  Admin
#  should be able to view all vendors
#
#  Background:
#    Given   User is logged in
#
#  Scenario: View all vendors
#    When  User logs in as admin
#    And   User is on vendors page
#    Then  User should be able to view all vendors
#    And   User should be able to view 'edit' link for each vendor
#    And   User should be able to view 'new' link
#    And   User should be able to view 'back' link

Feature: Creating a new Vendor
  In order to create a new vendor
  An Admin
  should be able to submit a new vendor

  Scenario: Create New Vendor
    Given Admin is logged in
    And   Admin is on 'new vendor' page
    And   Admin fills in "name" as "boogaBooga"
    And   Admin fills in "contact_no" as "1234567890"
    When  Admin creates a new vendor
    Then: Admin should be able to view all vendors including this one
    And   Admin should be able to view 'edit' link for each admin
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link