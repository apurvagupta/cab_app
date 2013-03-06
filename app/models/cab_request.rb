class CabRequest < ActiveRecord::Base

  attr_accessible :requester, :traveler_name, :contact_no, :pick_up_date_time, :source, :destination, :no_of_passengers, :comments

  validates_presence_of :traveler_name, :contact_no, :destination, :pick_up_date_time, :source, :no_of_passengers, :requester
  validates_format_of :traveler_name, with: /^[a-z.A-Z\s]*$/
  validates_numericality_of :contact_no, only_integer: true

  validates_length_of :contact_no, is: 10
  validates_length_of :comments, maximum: 25
  validates_length_of :traveler_name, maximum: 10

  validate :check_source_and_destination
  validate :date_and_time_validation

  #def self.to_csv(options = {})
  #  CSV.generate(options) do |csv|
  #    csv << column_names
  #    all.each do |cab_request|
  #      csv << cab_request.attributes.values_at(*column_names)
  #    end
  #  end
  #end

  def check_source_and_destination
    errors.add(:source, " and Destination can't be same") if source == destination
  end

  def date_and_time_validation
    current_time = Time.now
    errors.add(:pick_up_date_time, " and pick_up_date should not be less than current date-time") if pick_up_date_time < current_time rescue nil
  end

end

