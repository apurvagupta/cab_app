#Given /^I am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end
#
#When /^I go to (.+)$/ do |page_name|
#  visit path_to(page_name)
#end


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