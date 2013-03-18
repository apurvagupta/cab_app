#Feature: Manage Admins
#  In order to manage the admins
#  An Admin
#  should be able to view all assigned admins
#
#  Scenario: View all admins
#    Given Admin is logged in
#    And   Admin is on admins page
#    Then  User should be able to view all admins
#    And   User should be able to view 'edit' link for each admin
#    And   User should be able to view 'new' link
#    And   User should be able to view 'back' link

Feature: Creating a new Admin
  In order to create a new admin
  An Admin
  should be able to submit a new admin

  Scenario: Create New Admin
    Given Admin is logged in
    And   Admin is on 'new admin' page
    And   Admin fills in "name" as "boogaBooga"
    And   Admin fills in "contact_no" as "1234567890"
    When  Admin creates a new admin
    Then: Admin should be able to view all admins including this one
    And   Admin should be able to view 'edit' link for each admin
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link