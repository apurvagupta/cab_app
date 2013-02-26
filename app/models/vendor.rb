class Vendor < ActiveRecord::Base
	attr_accessible :name, :contact_no, :status

	  validates_presence_of :name, :contact_no
	  validates_numericality_of :contact_no, :only_integer => true
  	validates_length_of :contact_no , :is => 10
  	validates_format_of :name, :with => /^[a-zA-Z\s]*$/

  def set_vendor_status(vendor_name)
    @vendor_array = Vendor.all
    @vendor_array.each do |vendor|
      if(vendor.name == vendor_name)
        vendor.update_attribute(:status,'true')
      else
        vendor.update_attribute(:status,'false')
      end
    end
  end

end