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
    render_profile
  end

  def render_profile
    email = @student.email || "" #Possibly get the email with @student.email
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    @gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200"
    render :profile
  end

  def edit
    @student = @authenticated_user
    @view_only = false
    render_profile
  end

  def update
    s = params[:student]
    student_cid = session[:cas_user]

    StudentsController.cleanup_fields!(s)

    if s[:name] != '' and s[:about] != '' and student_cid!=nil
      @student = Student.create_or_update(s, student_cid)
      @view_only = true
      render_profile
    else
      missing = [:name,:about,:interest].select{ |e| s[e] == '' }.map{ |e| e.to_s }.join ', '
      flash[:notice] = "Please fill in the following fields: " + missing
      @view_only = false
      redirect_to student_edit_path @student
    end

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

  # TODO: Form validation!!
  def create
  	s = params[:student]
    student_cid = session[:cas_user]

    StudentsController.cleanup_fields!(s)

    if s[:name] != '' and s[:about] != '' and student_cid!=nil
  	  @student = Student.create_or_update(s, student_cid)
      @view_only = true
      redirect_to student_path @student
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
    if student.has_key? :course_ids
      student[:course_ids] = student[:course_ids].select { |c| not c.empty?}
    end
  end
end
