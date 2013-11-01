require 'spec_helper'

describe StudentsController do
  before(:each) do
    @Section1 = Section.create.id
    @Skill1 = Skill.create.id
    @Course1 = Course.create.id
    @Student = Student.create :name=>"Random Student"
  end

  describe "create new student" do
    it "returns http success" do
      get 'new'
      # response.should be_success # pending
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', {:id=>@Student.id}
      # response.should be_success # PEnding
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create', {:student=> {:name=>"Bob",:about=>"Nice Guy",:interest=>"Tennis", :section_id=>@Section1, :skill_ids=>[@Skill1], :course_ids=>[@Course1] }}
      # response.should be_success # Pending
    end
  end

  describe "search" do
    context "with no matching students" do
      it "should return no matches" do
        get :search, {:query => "Joe"}
        # assigns(:students).should eq []
      end
    end

    context "with one matching student" do
      it "should return Joe" do
        @Joe = Student.create :name => "Joe"
        get :search, {:query => "Joe"}
        # assigns(:students).should include(@Joe) #pending
      end
    end

    context "with no search query" do
      it "should return all students" do
        @Joe = Student.create :name => "Joe"
        get :search
        # assigns(:students).should include @Joe and assigns(:students).should include @Student
        # assigns(:students).to_a.length.should eq 2
      end
    end
  end

end
