Feature: User visits different pages
  In order to access the features of pages
  A user
  Should be able to see the pages of cab_app

Background:
  Given  User is logged in


Scenario: Requester home page
  And    Current User is not an Admin
  When   User is on the home page
  Then   User should be able to view 'cab request' form with blank fields
  And    User should be able to view 'View My Requests' link
  And    User should be able to view 'Contact Us' link
  And    User should be able to view 'Log Out' link


Scenario: Admins home page
  And    Current User is Admin
  When   User is on the home page
  Then   User should be able to view 'cab request' form with blank fields
  And    User should be able to view 'View My Requests' link
  And    User should be able to view 'Manage App' link
  And    User should be able to view 'View All Reports' link
  And    User should be able to view 'Log Out' link

Scenario: New Admin page
  When   User is on the new admin page
#  Then   User should be able to view

Scenario: Edit Admin page

Scenario: New Vendor page

Scenario: Edit Vendor page

Scenario: Support Centers page

Scenario: Support Centers edit page

Scenario: Support Centers show page
