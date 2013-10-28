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
    name_query = params[:query] || ""
    page = params[:page] || 1

    # TODO: if other settings, filter by them

    # Construct sql query
    num_pages, sql_query = Student.search_by_name(name_query, page)

    # Flash variables
    flash[:query] = name_query

    # View variables
    @students = sql_query
    @page = page
    @any_results = @students.any?
    @num_pages = num_pages
  end
end
