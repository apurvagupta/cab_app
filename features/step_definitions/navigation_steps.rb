# -*- encoding : utf-8 -*-


Given /^User is logged in$/ do
  CASClient::Frameworks::Rails::Filter.fake('homer')
end

Given /^Current User is Admin$/ do
  Admin.create!(name: 'homer', contact_no: '1234567890', status: false)
end


Given /^Current User is not an Admin$/ do
  Admin.delete_all
end


Given /^User is on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^There are admins and vendors/ do
  Vendor.create!(name:"deer",contact_no:"1234567890",status:false)
  Vendor.create!(name:"bear",contact_no:"1234567890",status:true)
  Admin.create!(name:"spider",contact_no:"9876543210",status:true)
end

Given /^User fills in ([^"]*) as ([^"]*)$/ do |element, text|
  fill_in element, with: text
end

Given /^User selects ([^"]*) from drop down list ([^"]*)$/ do |option, ddl|
  select option, :from => ddl

end


Given /^Users have some previous requests/ do
  CabRequest.create!( requester: 'homer', traveler_name: 'self',pick_up_date: '07/02/9999',
                      pick_up_date_time: '11:15 PM', contact_no: '9039409828',
                      source: 'Guest House', destination: 'ThoughtWorks', no_of_passengers: 1, comments: 'something' )
  CabRequest.create!( requester: 'owl', traveler_name: 'self',pick_up_date: '07/02/9999',
                      pick_up_date_time: '11:15 PM', contact_no: '9039409828',
                      source: 'Guest House', destination: 'ThoughtWorks', no_of_passengers: 1, comments: 'something' )
end


When /^User creates ([^"]*)$/ do  |action|
  if action == "cab_request"
    id = 'Create_' + action
  else
    id = 'Create ' + action
  end
  click_on id
end


When /^User updates ([^"]*)$/ do |type|
  click_on 'submit'
end

When /^User display reports/ do
  click_on 'display_reports'
end

Then /^User should be able to view active admin & active vendor/ do
  page.should have_xpath('//table[@id="table"]')
  page.should have_content('spider')
  page.should have_content('9876543210')
  page.should have_content('bear')
  page.should have_content('1234567890')
end

Then /^User should be able to view ([^"]*) link$/ do |content|
  page.should have_link content
end

Then /^User should be able to view cab_request form with blank fields$/ do
  page.should have_xpath('//form[@id="new_cab_request"]')
  page.should have_xpath('//input[@id="traveler_name"]')
  page.should_not have_xpath('//input[@id="traveler_name"][@value]')
  page.should have_xpath('//input[@id="contact_no"]')
  page.should_not have_xpath('//input[@id="contact_no"][@value]')
  page.should have_xpath('//input[@id="pick_up_date"]')
  page.should_not have_xpath('//input[@id="pick_up_date"][@value]')
  page.should have_xpath('//input[@id="pick_up_time"]')
  page.should_not have_xpath('//input[@id="pick_up_time"][@value]')
  page.should have_xpath('//select[@id="source"]/option[@value="Airport"]')
  page.should have_xpath('//select[@id="destination"]/option[@value="Airport"]')
  page.should have_xpath('//input[@id="no_of_passengers"]')
  page.should_not have_xpath('//input[@id="no_of_passengers"][@value]')
  page.should have_xpath('//input[@id="comments"]')
  page.should_not have_xpath('//input[@id="comments"][@value]')
end

#Then /^User should be able to view cab_request form with blank fields and appropriate error messages$/ do
#  page.should have_xpath('//form[@id="new_cab_request"]')
#  page.should have_xpath('//input[@id="traveler_name"][@value=""]')
#  page.should have_xpath('//input[@id="contact_no"][@value=""]')
#  page.should have_xpath('//input[@id="pick_up_date"][@value=""]')
#  page.should have_xpath('//input[@id="pick_up_time"]')
#  page.should_not have_xpath('//input[@id="pick_up_time"][@value]')
#  page.should have_xpath('//select[@id="source"]/option[@value="Airport"]')
#  page.should have_xpath('//select[@id="destination"]/option[@value="Airport"]')
#  page.should have_xpath('//input[@id="no_of_passengers"]')
#  page.should_not have_xpath('//input[@id="no_of_passengers"][@value]')
#  page.should have_xpath('//input[@id="comments"][@value=""]')
#  page.should have_content("Traveler name can't be blank")
#  page.should have_content("Contact no can't be blank")
#  page.should have_content("Contact no is not a number")
#  page.should have_content("Contact no is the wrong length (should be 10 characters)")
#  page.should have_content("Pick up date can't be blank")
#  page.should have_content("Pick up date time can't be blank")
#  page.should have_content("No of passengers can't be blank")
#  page.should have_content("No of passengers is not a number")
#  page.should have_content("No of passengers should not be more than 50")
#  page.should have_content("Source and Destination can't be same")
#end


Then /^User should be able to view new_([^"]*) form with blank fields$/ do |content|
  page.should have_xpath('//form[@id="new_'+content+'"]')
  page.should have_xpath('//input[@id="name"]')
  page.should_not have_xpath('//input[@id="name"][@value]')
  page.should have_xpath('//input[@id="contact_no"]')
  page.should_not have_xpath('//input[@id="contact_no"][@value]')
end

Then /^User should be able to view support_centers_show form with blank fields$/ do
  page.should have_xpath('//form[@id="show"]')
  page.should have_xpath('//input[@id="from_date"]')
  page.should_not have_xpath('//input[@id="from_date"][@value]')
  page.should have_xpath('//input[@id="to_date"]')
  page.should_not have_xpath('//input[@id="to_date"][@value]')
end

Then /^User should be able to view cab_request form with pre-filled fields and an appropriate error message$/ do
  page.should have_xpath('//form[@id="new_cab_request"]')
  page.should have_xpath('//input[@id="traveler_name"][@value="cat"]')
  page.should have_xpath('//input[@id="contact_no"][@value="1234567890"]')
  page.should have_xpath('//input[@id="pick_up_date"][@value="07/02/9999"]')
  page.should have_xpath('//input[@id="pick_up_time"][@value="11:30 PM"]')
  page.should have_xpath('//select[@id="source"]/option[@value="ThoughtWorks"][@selected=""]')
  page.should have_xpath('//select[@id="destination"]/option[@value="other"][@selected=""]')
  page.should have_xpath('//input[@id="other_destination"][@value="India Gate"]')
  page.should have_xpath('//input[@id="no_of_passengers"][@value="51"]')
  page.should have_xpath('//input[@id="comments"][@value="please"]')
  page.should have_content("No of passengers should not be more than 50")
end

Then /^User should be able to view edit_([^"]*) form with pre-filled fields$/ do |content|
  page.should have_xpath('//form[@id="edit_'+content+'_1"]')
  page.should have_xpath('//input[@id="name"][@value="homer"]')
  page.should have_xpath('//input[@id="contact_no"][@value="1234567890"]')
end

Then /^User should be able to view support_centers_edit form with drop down lists$/ do
  page.should have_xpath('//form[@id="edit"]')
  page.should have_xpath('//select[@id="admins"]/option[@value="spider"][@selected=""]')
  page.should have_xpath('//select[@id="admins"]/option[@value="homer"]')
  page.should have_xpath('//select[@id="vendors"]/option[@value="bear"][@selected=""]')
  page.should have_xpath('//select[@id="vendors"]/option[@value="deer"]')
end

Then /^User should be able to view all ([^"]*) including ([^"]*)/ do |category,type|
  if category.include? 'CabRequests'
    if category == 'his CabRequests'
      cab_requests = CabRequest.where(requester: 'homer')
    else
      cab_requests = CabRequest.all
    end
    cab_requests.each do |cab_request|
      page.should have_content(cab_request.requester)
      page.should have_content(cab_request.traveler_name)
      page.should have_content(cab_request.pick_up_date)
      page.should have_content(cab_request.pick_up_date_time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime('%I:%M %p'))
      page.should have_content(cab_request.contact_no)
      page.should have_content(cab_request.source)
      page.should have_content(cab_request.destination)
      page.should have_content(cab_request.no_of_passengers)
    end
  elsif category == 'Admins'
    admins = Admin.all
    admins.each do |admin|
      page.should have_content(admin.name)
      page.should have_content(admin.contact_no)
    end
  elsif category == 'Vendors'
    vendors = Vendor.all
    vendors.each do |vendor|
      page.should have_content(vendor.name)
      page.should have_content(vendor.contact_no)
    end
  end
  page.should have_xpath('//table[@id="table"]')
end

