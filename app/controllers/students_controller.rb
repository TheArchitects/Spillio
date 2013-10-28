class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
  	s = params[:student]
  	@student = Student.create(:name => s[:name], :about => s[:about],
  		:interest => s[:interest])
  	@student.section = Section.find(s[:section_id])
 	  @student.skills << Skill.find(params[:skill_ids])
  	@student.courses << Course.find(params[:course_ids])
  	@student.save
  end
end
