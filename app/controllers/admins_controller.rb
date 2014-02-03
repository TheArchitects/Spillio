class AdminsController < AuthenticatedController
  helper_method :get_num_groups, :get_name_requester_groups
  before_filter :check_for_admin

  def index
  end

  def show
    @partial = "main_panel_group_management"
    @cur_page = params["page"]

    case params["page"]
    when "gm"
      @partial = "main_panel_group_management"
    when "am"
      @submission_types = Submission.possible_submission_types.values
      @partial = "main_panel_assignment_management"
    when "pm"
      @new_project = Project.new
      @partial = "main_panel_project_management"
    end
  end

  # TODO: Refactor with better name, Validate
  def update
    if ((params.has_key?(:group_size)) && (not params[:group_size].empty?))
      update_max_group_size(params[:group_size])
    end
    if ((params.has_key?(:group_reader)) && (not params[:group_reader].empty?))
      update_group_readers(params[:group_reader])
    end
    redirect_to admin_path
  end

  def post_new_assignment
    # TODO Validate

    title = params[:title]
    description = params[:description]
    due_date = params[:due_date]
    max_grade = params[:assignment_max_grade]
    submission_types = params[:submission_types]
    submission_labels = params[:submission_labels]
    submission_labels = add_prefix(submission_labels) # Necessary for sorting purposes

    task = Task.create!(:title => title, :description => description, :due_date => due_date)
    task.assign_to_all_groups(max_grade, submission_types, submission_labels)

    flash[:success] = "Assignment sent to all groups"

    redirect_to :back
  end




  def promote_user_to_reader
    student_to_promote = Student.find_by_id(params[:id])
    student_to_promote.is_reader = true;
    student_to_promote.save
    flash[:success] = "#{student_to_promote.name} became a Reader."
    redirect_to :back
  end

  def promote_user_to_admin
    student_to_promote = Student.find_by_id(params[:id])
    student_to_promote.make_admin
    flash[:success] = "#{student_to_promote.name} became an Admin."
    redirect_to :back
  end


  def export_submissions
    respond_to do |format|
      format.html {
        @assignments_tabel = Task.find_by_id(params[:task_id]).build_full_assignments_list
        render "export_submissions"
      }
      format.csv { render text: Task.find_by_id(params[:task_id]).to_csv(request.host_with_port) }
      format.json { render json: Task.find_by_id(params[:task_id]).build_full_assignments_list.to_json}
    end
  end

  private

  def add_prefix(submission_labels)
    submission_labels.each_with_index.map{ |sub_lab, index| "#{(index+1).to_s}) #{sub_lab}" }
  end

  def check_for_admin
    unless @authenticated_user.is_admin?
      # The hacker will not even notice that this is a valid path ;)
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def update_max_group_size(new_group_size)
    if new_group_size != Setting.get_max_group_size
      flash[:success] = "Updated Group Max Size from #{Setting.get_max_group_size} to #{new_group_size}"
      Setting.set_max_group_size(params[:group_size])
    end
  end

  def update_group_readers(group_readers)
    updated_any_reader = false
    group_readers.each do |group_id, reader_id|
      if (not reader_id.empty?) && reader_id != "Please select"
        if (assign_reader_to_a_group(group_id, reader_id))
          updated_any_reader = true
        end
      end
    end
    if (updated_any_reader)
      flash[:success] = "Changes to group readers have been saved."
    end
  end

  # Returns false if it couldn't assign the reader (e.g., bc it was already
  # assigned)
  def assign_reader_to_a_group(group_id, reader_id)
    group = Group.find_by_id(group_id)
    reader = Student.find_by_id(reader_id)
    if group.reader != reader
      group.reader = reader
      group.save
      return true
    else
      return false
    end
  end

  def get_num_groups(p_id, priority)
    ProjectJoinRequest.where(:priority=>priority, :project_id=>p_id).to_a.length
  end

  def get_name_requester_groups(p_id, priority)
    names = ""
    ProjectJoinRequest.where(:priority=>priority, :project_id=>p_id).each do |pjr| 
      names = "#{Group.find_by_id(pjr.group_id).group_name.to_s}\n#{names}"
    end
    names
  end

end
