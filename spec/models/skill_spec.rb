require 'spec_helper'

describe Skill do
  describe "A skill" do
    it "should take a string as name" do
      Skill.create!({:name => 'Applied bananas'})
      Skill.find(:first).name.should eq('Applied bananas')
    end
  end
end
