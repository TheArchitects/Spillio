class StudentsController < AuthenticatedController


  def new
    @student = Student.new
    @view_only = false
    render :profile
  end

  def show
    @student = Student.find(params[:id])
    @view_only = true
    render :profile
  end

  def self.cid_exists? cid
    Student.find_by_cid(cid)!=nil
  end

  # Finds the student with Calnet Id number
  def show_by_cid
    @student = Student.find_by_cid(params[:id])

    if @student
      @view_only = true
      render :profile
    else
      redirect_to students_new_path
    end
  end

  # TODO: Form validation!!
  def create
  	s = params[:student]
    student_cid = session[:cas_user]
    if s[:name] != '' and s[:about] != '' and s[:interest] != '' and student_cid!=nil
      @student = Student.create(:name => s[:name], :about => s[:about],
        :interest => s[:interest], :cid => student_cid)
  	  @student.section = Section.find(s[:section_id])
 	    @student.skills << Skill.find(params[:skill_ids])
  	  @student.courses << Course.find(params[:course_ids])
  	  @student.save
    else
      @missing = [:name,:about,:interest].select{ |e| s[e] == '' }.map{ |e| e.to_s }.join ', '
      flash[:notice] = "Please fill in the following fields: " + @missing
      redirect_to students_new_path
    end
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
