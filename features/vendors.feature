Feature: Configuring Vendors
  In order to configure vendors
  An Admin
  should be able to create/update vendors

  Background:
    Given User is logged in
    And   Current User is Admin

  Scenario: Admin creates a new Vendor
    And   User is on the new vendor page
    And   User fills in vendor_name as bull
    And   User fills in vendor_contact_no as 1234567890
    When  User creates Vendor
    Then  User should be able to view all vendors including this one
    And   User should be able to view 'edit' link
    And   User should be able to view 'new' link
    And   User should be able to view 'back' link

  Scenario: Admin updates an existing Vendor
    And   User is on the edit vendor page
    And   User changes vendor's information
    When  User updates a vendor
    Then  User should be able to view all vendors including the updated one
    And   User should be able to view 'edit' link
    And   User should be able to view 'new' link
    And   User should be able to view 'back' link