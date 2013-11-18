class StudentsController < AuthenticatedController

  skip_before_filter :get_authenticated_user, :only => [:new, :create]

  def new
    # We can only create an user per cid
    if (not session[:cas_user].nil?) and User.exists_with_cid? session[:cas_user]
      render :status => :forbidden and return
    end

    @student = Student.new
    @view_only = false
    render :profile
  end

  def show
    @student = Student.find(params[:id])
    @view_only = true
    render :profile
  end

  def edit
    # TODO: Check user is a student
    @student = @authenticated_user
    @view_only = false
    render :profile
  end

  def update
    # TO DO make this work, show edit ok msg, check user valid
    @student = Student.find(params[:id])
    # @student.update_attributes!(params[:student])
    @view_only = true
    render :profile
  end

  # Finds the student with Calnet Id number
  def show_by_cid
    @student = Student.find_by_cid(params[:id])

    if @student
      @view_only = false
      render :profile
    else
      redirect_to new_student_path
    end
  end

  # TODO: Form validation!!
  def create
  	s = params[:student]
    student_cid = session[:cas_user]

    StudentsController.cleanup_fields!(s)

    if s[:name] != '' and s[:about] != '' and student_cid!=nil
  	  @student = Student.create_for_current_user!(s, student_cid)
      @view_only = true
      redirect_to "/students/#{@student.id}"
    else
      missing = [:name,:about,:interest].select{ |e| s[e] == '' }.map{ |e| e.to_s }.join ', '
      flash[:notice] = "Please fill in the following fields: " + missing
      redirect_to new_student_path
      # TODO: Persist params in flash and retrieve them from the view
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

  private

  def self.cleanup_fields!(student)
    # Remove empty skill and course ids, cause they appear for
    # some weird and unknown reason
    if student.has_key? :skill_ids
      student[:skill_ids] = student[:skill_ids].select { |sk| not sk.empty?}
    end

    if student.has_key? :course_ids
      student[:course_ids] = student[:course_ids].select { |c| not c.empty?}
    end
  end
end
