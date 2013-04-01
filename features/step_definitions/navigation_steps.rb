# -*- encoding : utf-8 -*-


Given /^User is logged in/ do
  CASClient::Frameworks::Rails::Filter.fake('homer')
end

Given /^Current User is ([^"]*)$/ do |category|
  if category == 'Admin'
    Admin.create!(name: 'homer', contact_no: '1234567890', status: false)
  elsif category == 'not an Admin'
    Admin.delete_all
  end
end


Given /^User is on (.+)$/ do |page_name|

  if page_name.include? 'the edit'
    page_name =~ /the edit (.*) page/
    if $1 == 'admins'
      id = Admin.pluck(:id).first.to_s
    elsif $1 == 'vendors'
      Vendor.create!(name:'deer',contact_no: '1234567890',status:false)
      id = Vendor.pluck(:id).first.to_s
    end
    url = '/' + $1 + '/' + id + '/edit'
    visit url
  else
    visit path_to(page_name)
  end
end

Given /^There are admins and vendors/ do
  Vendor.create!(name:"deer",contact_no:"9876543210",status:false)
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
  id = 'Create ' + action
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

Then /^User should be able to view '([^"]*)' ([^"]*)$/ do |content,type|
  if type == 'link'
    page.should have_link content
  elsif type == 'form with blank fields'
    page.should have_xpath('//form[@id="new_cab_request"]')
    #page.should have_xpath('//input[@id="traveler_name"][@value=""]')
    #page.should have_xpath('//input[@id="contact_no"][@value=""]')
    #page.should have_xpath('//input[@id="pick_up_date"][@value=""]')
    #page.should have_xpath('//input[@id="pick_up_time"][@value=""]')
    #page.should have_xpath('//select[@id="source"]/option[@value="Airport"][@selected=""]')
    #page.should have_xpath('//select[@id="destination"]/option[@value="Airport"][@selected=""]')
    #page.should have_xpath('//input[@id="no_of_passengers"][@value=""]')
    #page.should have_xpath('//input[@id="comments"][@value=""]')
  elsif type == 'form with pre-filled fields'
    page.should have_xpath('//form[@id="new_cab_request"]')
    page.should have_xpath('//input[@id="traveler_name"][@value="cat"]')
    page.should have_xpath('//input[@id="contact_no"][@value="1234567890"]')
    page.should have_xpath('//input[@id="pick_up_date"][@value="07/02/9999"]')
    page.should have_xpath('//input[@id="pick_up_time"][@value="11:30 PM"]')
    page.should have_xpath('//select[@id="source"]/option[@value="ThoughtWorks"][@selected=""]')
    page.should have_xpath('//select[@id="destination"]/option[@value="other"][@selected=""]')
    page.should have_xpath('//input[@id="other_destination"][@value="India Gate"]')
    page.should have_xpath('//input[@id="no_of_passengers"][@value="51"]')
    page.should have_xpath('//input[@id="comments"][@value=""]')
  elsif type == 'error message'
    page.should have_content("No of passengers should not be more than 50")
  elsif type == 'error messages'
    page.should have_content("Traveler name can't be blank")
    page.should have_content("Contact no can't be blank")
    page.should have_content("Contact no is not a number")
    page.should have_content("Contact no is the wrong length (should be 10 characters)")
    page.should have_content("Pick up date can't be blank")
    page.should have_content("Pick up date time can't be blank")
    page.should have_content("No of passengers can't be blank")
    page.should have_content("No of passengers is not a number")
    page.should have_content("No of passengers should not be more than 50")
    page.should have_content("Source and Destination can't be same")
  end
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


Then /^User should be able to view CabRequest form with ([^"]*)$/ do |fields|
  if fields.include? 'pre-filled'
  elsif fields.include? 'blank'
    page.should have_xpath('//form[@id="new_cab_request"]')
  end
end
