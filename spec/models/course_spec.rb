require 'spec_helper'

describe Course do
  describe "A course" do
    it "should take a string as name" do
      Course.create!({:name => 'Applied bananas'})
      Course.find(:first).name.should eq('Applied bananas')
    end
  end
end
