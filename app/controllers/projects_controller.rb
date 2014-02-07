class ProjectsController < AuthenticatedController
  # TODO Remove this and similar thing from authenticated_controller
  skip_before_filter :get_authenticated_user, :only => [:request_from_group]

  # GET /projects
  # GET /projects.json
  def index
    if @authenticated_user.class == Student
      @group_id = @authenticated_user.group.id
    end
    @projects = Project.all
    @any_results = @projects.any?
    @has_voted = false
    @voted_projects = [] 
    votes = ProjectJoinRequest.where(priority: [1,2,3,4,5], group_id: @group_id).order("priority ASC")
    0.upto(4).each{|i| 
      proj_req = votes.find_by_priority(i+1)
      if not proj_req.nil?
        @voted_projects[i] = proj_req.project.title
        @has_voted = true
      else
        @voted_projects[i] = " --- "
      end
      }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def destroy
    if @authenticated_user.is_admin?
      project_id = params[:id]
      Project.find(project_id).destroy
      flash[:success]= "Project successfully deleted."
    end
    redirect_to :back
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        flash[:success] = "#{@project.title} added!"
        format.html { redirect_to :back }
        format.json { render json: @project, status: :created, location: @project }
      else
        flash[:error] = "Wrong parameters!"
        format.html { redirect_to :back }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_priorities
    group = Group.find params[:group_id]
    if group.id != @authenticated_user.group_id
      flash[:error] = "Please don't try to hack the system."
      redirect_to :back
      return
    end

    project_priorities = params[:projects]
    
    if project_priorities.nil?
      reqs = ProjectJoinRequest.where(group_id: group.id)
      reqs.each{|r| r.destroy}
      flash[:warning] = "Selections has been removed."
      redirect_to :back
      return
    end
    project_priorities.each do |project_id,priority|
      req = ProjectJoinRequest.where(priority: priority, group_id: group.id).first
      if req.nil?
       req = ProjectJoinRequest.create(priority: priority, group_id: group.id)
      end
      req.project_id = project_id
      req.save!
    end

    flash[:success] = "You have successfully submitted your choices"
    redirect_to :back
  end

  def get_matches
    #TO-DO: you can only call this if you are an instructor

    @matches = {}
    not_matched = []
    remaining_groups = Group.all.to_a
    Project.all.each do |proj|
      requests = get_highest_priority_requests(proj)
      if requests.length > 1
        @matches[proj] = get_highest_priority_group(requests)
        remaining_groups.delete(matches[proj])
      elsif requests.length == 1
        @matches[proj] = Group.find(requests[0].group_id)
        remaining_groups.delete(@matches[proj])
      else
        not_matched.append(proj)
      end
    end
    not_matched.each do |proj|
      @matches[proj] = remaining_groups.pop
    end

    @matches.each do |proj, group|
      proj.group = group
      proj.save
    end
    redirect_to '/admin'
  end


  private
  def get_highest_priority_requests(proj)
    highest_priority = 100
    requests = []
    proj.project_join_requests.each do |req|
      if highest_priority > req.priority
        high_priority = req.priority
        requests = [req]
      elsif highest_priority == req.priority
        requests.append(req)
      end
    end
    requests
  end

  def get_highest_priority_group(requests)
    earliest_time = nil?
    earliest_group = nil?
    requests.all.each do |req|
      if earliest_time.nil?
        earliest_time = req.created_at
        earliest_group = Group.find(req.group_id)
      elsif earliest_time > req.time
        earliest_time = req.created_at
        earliest_group = Group.find(req.group_id)
      end
    end
    earliest_group
  end

end
