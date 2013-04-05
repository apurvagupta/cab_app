# -*- encoding : utf-8 -*-
  require 'spec_helper'

describe CabRequest do

  before :each do
    @cab_request = build(:cab_request)
  end

  context 'Class structure validations' do

    it 'should have all required fields  ' do
      (@cab_request.has_attribute? :requester).should be_true
      (@cab_request.has_attribute? :traveler_name).should be_true
      (@cab_request.has_attribute? :contact_no).should be_true
      (@cab_request.has_attribute? :pick_up_date_time).should be_true
      (@cab_request.has_attribute? :source).should be_true
      (@cab_request.has_attribute? :destination).should be_true
      (@cab_request.has_attribute? :no_of_passengers).should be_true
      (@cab_request.has_attribute? :comments).should be_true
    end

  end

  context 'all mandatory fields' do

    it 'should contain a value' do
      @cab_request.save.should be_true
    end

  end

  context 'requester' do
    it 'should not be blank' do
      @cab_request.requester = nil
      @cab_request.save.should be_false
      @cab_request.errors[:requester].first.should == 'can\'t be blank'
    end
  end

  context 'traveler name' do
    it 'should not be blank' do
      @cab_request.traveler_name = nil
      @cab_request.save.should be_false
      @cab_request.errors[:traveler_name].first.should == 'can\'t be blank'
    end
  end

  context 'Contact number ' do

    it 'should not be blank' do
      @cab_request.contact_no = nil
      @cab_request.save.should be_false
      @cab_request.errors[:contact_no].first.should == 'can\'t be blank'
    end

  end

  context 'pick_up_date_time' do
    it 'should not be blank' do
      @cab_request.pick_up_date_time = nil
      @cab_request.save.should be_false
      @cab_request.errors[:pick_up_date_time].first.should == 'can\'t be blank'
    end

    it 'should be in future only' do
      @cab_request.pick_up_date_time = Time.new(1991, 02, 07, 4, 0, 0, '+05:30')
      @cab_request.save.should be_false
      @cab_request.errors[:pick_up_date_time].first.should == 'should not be less than current time'
    end

  end
  context 'pick_up_date' do
    it 'should not be blank' do
      @cab_request.pick_up_date = nil
      @cab_request.save.should be_false
      @cab_request.errors[:pick_up_date].first.should == 'can\'t be blank'
    end
  end

  context 'Source' do

    it 'should not be blank' do
      @cab_request.source = nil
      @cab_request.save.should be_false
      @cab_request.errors[:source].first.should == 'can\'t be blank'
    end

    it 'Should not be same as Destination' do
      @cab_request.destination=@cab_request.source
      @cab_request.save.should be_false
      @cab_request.errors[:source].first.should== ' and Destination can\'t be same'
    end

    it 'should not be more than 20 characters' do
      @cab_request.source = 'Hello'*50
      @cab_request.save.should be_false
      @cab_request.errors[:source].first.should == 'is too long (maximum is 20 characters)'
    end

  end

  context 'Destination' do

    it 'should not be blank' do
      @cab_request.destination = nil
      @cab_request.save.should be_false
      @cab_request.errors[:destination].first.should == 'can\'t be blank'
    end

    it 'should not be more than 20 characters' do
      @cab_request.destination = 'Hello'*50
      @cab_request.save.should be_false
      @cab_request.errors[:destination].first.should == 'is too long (maximum is 20 characters)'
    end
  end

  context 'No of Passengers' do

    it 'should not be blank' do
      @cab_request.no_of_passengers = nil
      @cab_request.save.should be_false
      @cab_request.errors[:no_of_passengers].first.should == 'can\'t be blank'
    end

    it 'should be numeric' do
      @cab_request.no_of_passengers='fdds'
      @cab_request.save.should be_false
      @cab_request.errors[:no_of_passengers].first.should =='is not a number'
    end

    it 'should not be more than 50' do
      @cab_request.no_of_passengers=80
      @cab_request.save.should be_false
      @cab_request.errors[:no_of_passengers].first.should=='should not be more than 50'
    end
  end

  context 'Comments' do

    it 'should not contain more than 100 characters' do
      @cab_request.comments = 'hello'*7
      @cab_request.save.should be_false
      @cab_request.errors[:comments].first.should == 'is too long (maximum is 25 characters)'
    end
  end

end
