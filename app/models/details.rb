class Details < ActiveRecord::Base

  attr_accessible :support_phone_no, :vendor_phone_no, :assigned_admins

  validates_presence_of :support_phone_no, :vendor_phone_no, :assigned_admins
  validates_numericality_of :support_phone_no , :vendor_phone_no, :only_integer => true
  validates_length_of :support_phone_no , :vendor_phone_no , :is => 10
  validates_format_of :assigned_admins, :with => /\A[^0-9]+\Z/

end