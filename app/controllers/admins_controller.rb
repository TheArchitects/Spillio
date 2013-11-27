class AdminsController < AuthenticatedController

  def index

  end

  def show
    #instructor? = @authenticated_user.is_administrator
    #unless instructor?
      #flash[:notice] = 'You do not have permission to view this page'
      #redirect_to student_path @authenticated_user
      #return
    #end
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

  def post_new_task(title, description, due_date)
    new_task = Task.create(:title=>title, :description=>description, :due_date=>due_date)
  end

  def assign_grade(assignment, score, max_score)
    new_score = Score.create(:max_score=>max_score,:score=>score)
    assignment.scores << new_score
  end

  def new_assignment

  end

  def post_new_assignment
    # To Do Validate
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
end
