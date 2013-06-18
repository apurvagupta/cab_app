# -*- encoding : utf-8 -*-
class CabRequest < ActiveRecord::Base
  attr_accessor :pick_up_date

  attr_accessible :requester, :traveler_name, :contact_no, :pick_up_date, :pick_up_date_time, :source, :destination, :no_of_passengers, :comments, :status

  validates_presence_of :requester, :traveler_name, :contact_no, :pick_up_date, :pick_up_date_time, :source, :destination, :no_of_passengers
  validates_length_of :traveler_name, maximum: 35
  validates_length_of :contact_no, minimum: 10
  validates_length_of :source, maximum: 20
  validates_length_of :destination, maximum: 20
  validates_numericality_of :no_of_passengers, only_integer: true
  validates_inclusion_of :no_of_passengers, in: 1..50, message: 'should not be more than 50'
  validates_length_of :comments, maximum: 25

  validate :check_source_and_destination
  validate :time_validation

  def check_source_and_destination
    errors.add(:source, ' and Destination can\'t be same') if source == destination
  end

  def time_validation
    unless pick_up_date_time.nil?
      current_time = Time.now
      errors.add(:pick_up_date_time,'should not be less than current time') if pick_up_date_time < current_time
    end
  end

end

