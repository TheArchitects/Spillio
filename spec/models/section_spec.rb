require 'spec_helper'

describe Section do
  describe "A section" do
    it "should have an integer as a number" do
      Section.create!({:number => 532})
    end
  end
  # ToDo: Tests for integration with students
end
