#Given /^I am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end
#
#When /^I go to (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

#Given /^User fill in other_destination as ([^"]*)$/ do |text|
#  find(:xpath, "//input[@id= other_destination]").set text
#end

Given /^User logs in/ do
   click_on "LOGIN"
end

Given /^User is logged in/ do
  CASClient::Frameworks::Rails::Filter.fake("homer")
end

Given /^Current User is ([^"]*)$/ do |category|
  if(category == "Admin")
    Admin.create!(name: "homer", contact_no: "1234567890", status: false)
  elsif(category == "not an Admin")
    Admin.delete_all
  end
end

Given /^User is on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^User fills in ([^"]*) as ([^"]*)$/ do |element, text|
  fill_in element, with: text
end

Given /^User selects ([^"]*) from drop down list ([^"]*)$/ do |option, ddl|
  select option, :from => ddl
end

Given /^User has its previous requests/ do
  CabRequest.create!( requester: "homer", traveler_name: "self",pick_up_date: "07/02/9999",
                      pick_up_date_time: "11:15am", contact_no: "9039409828",
                      source: "Guest House", destination: "ThoughtWorks", no_of_passengers: 1, comments: "something" )
end

When /^User creates ([^"]*)$/ do  |action|
  id = "Create " + action
  click_on id
end

Then /^User should be able to view '([^"]*)' ([^"]*)$/ do |content,type|
  if type=="link"
    page.should have_link content
  elsif type== "form"
    page.should have_xpath('//form[@id="new_cab_request"]')
  end
end