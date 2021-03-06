# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Admin do

  before :each do
    @admin = build(:admin)
  end

  context 'Class structure validations' do

    it 'should have all required fields' do
      (@admin.has_attribute? :name).should be_true
      (@admin.has_attribute? :contact_no).should be_true
      (@admin.has_attribute? :status).should be_true
    end

  end

  context 'all mandatory fields' do

    it 'should contain a value' do
      @admin.save.should be_true
    end

  end

  context 'admin name' do

    it 'should not be blank' do
      @admin.name = nil
      @admin.save.should be_false
    end

    it 'should be unique' do
      @admin.save.should be_true
      @admin1 = build(:admin)
      @admin1.save.should be_false
      @admin1.errors[:name].first.should == 'has already been taken'

    end

    it 'should not contain digits' do
      @admin.name = 'hello@123'
      @admin.save.should be_false
    end

  end

  context 'User contact number ' do

    it 'should not be blank' do
      @admin.contact_no = nil
      @admin.save.should be_false
      @admin.errors[:contact_no].first.should == 'can\'t be blank'
    end

    it 'should not contain non-numeric data' do
      @admin.contact_no = 'a$$@7466748'
      @admin.save.should be_false
      @admin.errors[:contact_no].first.should == 'is not a number'
    end

    it 'should not contain more or less than ten digits' do
      @admin.contact_no = '45678'
      @admin.save.should be_false
      @admin.errors[:contact_no].first.should == 'is the wrong length (should be 10 characters)'
    end

  end
  context 'Email' do

    it 'should not be blank' do
      @admin.email = nil
      @admin.save.should be_false
    end

  end

  context 'User Status ' do
    it 'should not contain other than a boolean value ' do
      @admin.status = nil
      @admin.save.should be_false
      @admin.errors[:status].first.should == 'is not included in the list'
    end
  end

end
