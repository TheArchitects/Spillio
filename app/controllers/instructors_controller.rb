class InstructorsController < AuthenticatedController

  def show
    #instructor? = @authenticated_user.is_administrator
    #unless instructor?
      #flash[:notice] = 'You do not have permission to view this page'
      #redirect_to student_path @authenticated_user
      #return
    #end
  end

  def update
    if params[:group_size]
      set_group_size(params[:group_size])
    end
    if params[:group_instructor]
      params[:group_instructor].each do |group_id, instructor_id|
        set_group_instructor(group_id, instructor_id)
      end
    end
    redirect_to "/group_management"
  end

  def set_group_size(size)
    Group.max_students = size
  end

  def set_group_instructor(group_id, instructor_id)
    group = Group.find(group_id)
    instructor = Instructor.find(instructor_id)
    group.instructor = instructor
    instructor.groups << group
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
