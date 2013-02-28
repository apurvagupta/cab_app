class Admin < ActiveRecord::Base
	 attr_accessible :name, :contact_no, :status

   validates_presence_of :name, :contact_no ,:status
   validates_numericality_of :contact_no, :only_integer => true
   validates_length_of :contact_no, :is => 10
   validates_format_of :name, :with => /^[a-zA-Z\s]*$/

  def set_admin_status(admin_name)
    @admin_array = Admin.all
    @admin_array.each do |admin|
      if(admin.name == admin_name)
        admin.update_attribute(:status,'true')
      else
        admin.update_attribute(:status,'false')
      end
    end
  end

end
