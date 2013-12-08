class StudentsController < AuthenticatedController

  skip_before_filter :get_authenticated_user, :only => [:new, :create]

  def new
    # We can only create an user per cid
    if (not session[:cas_user].nil?) and User.exists_with_cid? session[:cas_user]
      render :status => :forbidden and return
    end

    @student = Student.new
    @view_only = false
    render_profile
  end

  def show
    @student = Student.find(params[:id])
    @view_only = true
    @show_promote_link = true
    render_profile
  end

  def render_profile
    @gravatar_url = @student.gravatar_url
    render :profile
  end

  def edit
    @student = @authenticated_user
    @view_only = false
    render_profile
  end

  # TODO: Form validation!!
  def create
    create_or_update_handler
  end

  def update
    create_or_update_handler
  end

  # Finds the student with Calnet Id number
  def show_by_cid
    @student = Student.find_by_cid(params[:id])

    if @student
      @view_only = false
      render_profile
    else
      redirect_to new_student_path
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

  def create_or_update_handler
    s = params[:student]
    student_cid = session[:cas_user]
    StudentsController.cleanup_fields!(s)

    if Student.enough_fields?(s, student_cid)
      create_and_render_student(s, student_cid)
    else
      missing = StudentsController.list_of_missing_params(s)
      flash[:error] = "Please fill in the following fields: " + missing
      redirect_to :back
    end
  end

  def create_and_render_student(s, student_cid)
    @student = Student.create_or_update(s, student_cid)
    redirect_to student_path(:id => @student.id)
  end

  def self.cleanup_fields!(student)
    # Remove empty skill and course ids, cause they appear for
    # some weird and unknown reason
    if student.has_key? :course_ids
      student[:course_ids] = student[:course_ids].select { |c| not c.empty?}
    end
  end

  def self.list_of_missing_params(s)
    [:name,:about,:interest].select{ |e| s[e] == '' }.map{ |e| e.to_s }.join ', '
  end
end
