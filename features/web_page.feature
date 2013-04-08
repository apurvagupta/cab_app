Feature: User visits different pages
  In order to access the features of pages
  A user
  Should be able to see the pages of cab_app

Background:
  Given  User is logged in


Scenario: Requester home page
  And    Current User is not an Admin
  When   User is on the home page
  Then   User should be able to view cab_request form with blank fields
  And    User should be able to view View My Requests link
  And    User should be able to view Contact Us link
  And    User should be able to view Logout link


Scenario: Admins home page
  And    Current User is Admin
  When   User is on the support centers show page
  Then   User should be able to view support_centers_show form with blank fields
  And    User should be able to view Book A Cab link
  And    User should be able to view View My Requests link
  And    User should be able to view Manage App link
  And    User should be able to view View All Reports link
  And    User should be able to view Logout link

Scenario: New Admin page
  And    Current User is Admin
  When   User is on the new admin page
  Then   User should be able to view new_admin form with blank fields

Scenario: Edit Admin page
  And    Current User is Admin
  When   User is on the edit admins page
  Then   User should be able to view edit_admin form with pre-filled fields

Scenario: New Vendor page
  And    Current User is Admin
  When   User is on the new vendor page
  Then   User should be able to view new_vendor form with blank fields

Scenario: Edit Vendor page
  And    Current User is Admin
  When   User is on the edit vendors page
  Then   User should be able to view edit_vendor form with pre-filled fields

@javascript
Scenario: Support Centers edit page
  And    Current User is Admin
  And    There are admins and vendors
  When   User is on the support centers edit page
  Then   User should be able to view support_centers_edit form with drop down lists

Scenario: Support Centers show page
  And    Current User is Admin
  When   User is on the support centers show page
  Then   User should be able to view support_centers_show form with blank fields
