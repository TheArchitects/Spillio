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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
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

  # PUT /projects/1
  # PUT /projects/1.json
  
  #def update
  #  @project = Project.find(params[:id])
  #  respond_to do |format|
  #    if @project.update_attributes(params[:project])
  #      format.html { redirect_to @project, notice: 'Project was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @project.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end


  # DELETE /projects/1
  # DELETE /projects/1.json
#  def destroy
#    @project = Project.find(params[:id])
#    @project.destroy
#
#    respond_to do |format|
#      format.html { redirect_to projects_url }
#      format.json { head :no_content }
#    end
#  end

  def get_project_join_request(group, project, priority)
    req = nil
    ProjectJoinRequest.all.each do |pjr|
      if pjr.group_id == group.id and pjr.project_id == project.id
        req = pjr
        break
      elsif pjr.group_id == group.id and pjr.priority.to_i.to_s == priority and pjr.project_id != project.id
        pjr.destroy
      end
    end
    if req.nil?
      req = ProjectJoinRequest.create(:group_id => params[:group_id], :project_id => params[:project_id])
    end
    req
  end

  def request_from_group
    group = Group.find params[:group_id]
    project = Project.find params[:project_id]
    priority = params[:priority]

    # If there was a prev request for same gr and proj, then update it
    # else create it from scratch
    # TODO: something like:
    # pr = ProjectJoinRequest.find_or_initialize_by_requester_and_requestee(group, project)
    pr = get_project_join_request(group, project, priority)
    pr.group = group
    pr.project = project
    pr.priority = priority
    pr.save!

    # TODO: Now if there was a request for same gr and priority but diff proj,
    # remove it
    render :nothing => true, :status => 200
  end

  def get_matches
    #TO-DO: you can only call this if you are an instructor

    @matches = {}
    not_matched = []
    remaining_groups = Group.all.to_a
    Project.all.each do |proj|
      requests = get_highest_priority_requests(proj)
      debugger
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
