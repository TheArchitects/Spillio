require 'spec_helper'

describe Student do
  before do
    @Section1 = Section.create.id
    @Skill1 = Skill.create.id
    @Course1 = Course.create.id
  end

  describe "Student search" do
    it "should be able to search students by name" do
      bob = Student.create!({:name=>"Bob",:about=>"Nice Guy",:interest=>"Tennis"})
      Student.search_by_name("Bob")[0].should eq(bob)
      Student.search_by_name("Peter").should eq([])
    end
  end
  # ToDo: foreign keys, search by other params once we implement it
end
