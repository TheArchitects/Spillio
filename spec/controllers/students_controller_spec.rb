require 'spec_helper'

describe StudentsController do
  before do
    @Section1 = Section.create.id
    @Skill1 = Skill.create.id
    @Course1 = Course.create.id
  end
  #describe "GET 'show'" do
    #it "returns http success" do
      #get 'show', {:id=>@Student1}
      #response.should be_success
    #end
  #end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create', {:student=> {:name=>"Bob",:about=>"Nice Guy",:interest=>"Tennis", :section_id=>@Section1}, :skill_ids=>@Skill1, :course_ids=>@Course1 }
      response.should be_success
    end
  end

end
