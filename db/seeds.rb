# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.create( name: "pulkitko", contact_no: "8527644166", status: true)
vendor = Vendor.create( name: "gopal", contact_no: "9812345678", status: true)
CabRequest.create!(requester: "homer", traveler_name: "self",pick_up_date_time: Time.now + 2.days,
                  contact_no: "9039409828",source: "Guest House", destination: "ThoughtWorks",
                  no_of_passengers: 1, comments: "something", pick_up_date: (Time.now + 2.days).to_date )