require 'spec_helper'

describe ApplicationHelper do
  it 'should convert time to IST correctly.'do
    original_time = Time.now.utc
    expected_time = (original_time + 19800).strftime("%I:%M %P")
    converted_time = ist(original_time)

    converted_time.should == expected_time

  end
end