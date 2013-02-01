class CabRequest < ActiveRecord::Base

  attr_accessible :phone_no ,:destination , :drop_time , :comments

  validates_presence_of :phone_no , :destination, :drop_time
  validates_numericality_of :phone_no, :only_integer => true
  validates_length_of :phone_no, :is => 10
  validates_length_of :comments, :maximum => 100

end