class AdminsController < AuthenticatedController

  before_filter :check_for_admin

  def index
  end

  def show
    @partial = "main_panel_group_management"

    case params["page"]
    when "gm"
      @partial =  "main_panel_group_management"
    when "na"
      @partial = "main_panel_new_assignment"
    when "ag"
      @partial = "main_panel_assign_grades"
    end
  end

  # returning all the groups associated to this reader
  def mygroups
    Group.get_groups_for(@authenticated_user.id)
  end

  def update
    new_group_size = params[:group_size]
    if new_group_size and new_group_size != Setting.get_max_group_size and new_group_size != ""
      flash[:notice] = "Updated Group Max Size from #{Setting.get_max_group_size} to #{new_group_size}"
      Setting.set_max_group_size(params[:group_size])
    end
    if params[:group_reader]
      params[:group_reader].each do |group_id, reader_id|
        if reader_id != "Please select"
          assign_reader_to_a_group(group_id, reader_id)
        end
      end
      flash[:notice] = "Changes to group readers have been saved."
    end
    redirect_to admin_path
  end

  def assign_reader_to_a_group(group_id, reader_id)
    group = Group.find_by_id(group_id)
    reader = Student.find_by_id(reader_id)
    group.reader = reader
    group.save
  end

  def assign_grade(assignment, score, max_score)
    assignment.score = new_score
  end

  def new_assignment
  end

  def post_new_assignment
    # TODO: Update for new scoring system, for adding submission fields

    # TODO Validate
    title = params[:task_name]
    description = params[:description]
    due_date = Date.parse(params[:due_date])
    max_score = params[:max_score]
    label = params[:submission_label]

    task = Task.create!(:title => title, :description => description, :due_date => due_date)

    Group.all.each do |group|
      assignment = Assignment.create_from_group_and_task(group, task)
      assignment.scores << Score.create!(:max_score => max_score)
      assignment.submissions << Submission.create!(:label => label)
      assignment.save
    end

    render :text => "Assignment posted :D"
  end

  def promote_user_to_reader
    if params[:id]=="-1"
      flash[:error] = "You should be on the user's profile page before promoting!"      
    else
      student_to_promote = Student.find_by_id(params[:id])
      student_to_promote.is_reader = true;
      student_to_promote.save
      flash[:notice] = "#{student_to_promote.name} became a reader."
    end
    redirect_to :back
  end


  private


  def check_for_admin
    unless @authenticated_user.class == Admin
      # The hacker will not even notice that this is a valid path ;)
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end
end
