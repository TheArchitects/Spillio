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

  def search
    # TODO: if other settings, filter by them
    # TODO: paging

    # If we have been given a name, return users who contain it
    # Else return all
    if params.has_key?(:query)
      @students = Student.search_by_name(params[:query])
      @any_results = @students.any?
    else
      @students = Student.all
      @any_results = @students.any?
    end
  end
end
