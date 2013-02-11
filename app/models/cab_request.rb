class CabRequest < ActiveRecord::Base

  attr_accessible :id,:requester,:pick_up_for, :contact_no, :date, :time ,:source,:destination,:no_of_passengers, :comments

  validates_presence_of :id,:pick_up_for, :contact_no , :destination, :time, :source,:no_of_passengers, :date , :requester
  validates_format_of :pick_up_for, :with => /^[a-zA-Z\s]*$/
  validates_numericality_of :contact_no, :only_integer => true

  validates_length_of :contact_no, :is => 10
  validates_length_of :comments, :maximum => 25
  validates_length_of :pick_up_for, :maximum => 10
end