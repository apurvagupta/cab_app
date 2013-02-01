class CabRequest < ActiveRecord::Base
  attr_accessible :phone_no ,:destination, :comments, :drop_time
  validates_presence_of :phone_no

end