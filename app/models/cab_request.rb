class CabRequest < ActiveRecord::Base

  attr_accessible :requester,:pick_up_for, :contact_no, :date, :pick_up_time ,:source,:destination,:no_of_passengers, :comments

  validates_presence_of :pick_up_for, :contact_no , :destination, :pick_up_time, :source,:no_of_passengers, :date , :requester
  validates_format_of :pick_up_for, :with => /^[a-zA-Z\s]*$/
  validates_numericality_of :contact_no, :only_integer => true

  validates_length_of :contact_no, :is => 10
  validates_length_of :comments, :maximum => 25
  validates_length_of :pick_up_for, :maximum => 10

  validate :check_source_and_destination

  def check_source_and_destination
    errors.add(:source ," and Destination can't be same") if source == destination

  end

end

