Feature: Configuring Vendors
  In order to configure vendors
  An Admin
  should be able to create/update vendors

  Background:
    Given Admin is logged in

  Scenario: Create New Vendor
    And   Admin is on 'new vendor' page
    And   Admin fills vendor information
    When  Admin creates a new vendor
    Then  Admin should be able to view all vendors including this one
    And   Admin should be able to view 'edit' link for each vendor
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link

  Scenario: Update an existing Vendor
    And   Admin is on 'edit vendor' page
    And   Admin changes vendor's information
    When  Admin updates a vendor
    Then  Admin should be able to view all vendors including the updated one
    And   Admin should be able to view 'edit' link for each vendor
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link