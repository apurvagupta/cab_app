# -*- encoding : utf-8 -*-
class Vendor < ActiveRecord::Base
  attr_accessible :name, :contact_no, :email, :status

  validates_uniqueness_of :name
  validates_presence_of :name, :contact_no, :email
  validates_inclusion_of :status, in: [true, false]
  validates_numericality_of :contact_no, only_integer: true
  validates_length_of :contact_no, is: 10
  validates_format_of :name, with: /^[a-zA-Z\s]*$/
end


