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

  def request_from_group
    group = Group.find params[:group_id]
    project = Project.find params[:project_id]
    priority = params[:priority]

    # If there was a prev request for same gr and proj, then update it
    # else create it from scratch
    # TODO: something like:
    # pr = ProjectJoinRequest.find_or_initialize_by_requester_and_requestee(group, project)
    pr = ProjectJoinRequest.create(:requester => group, :requestee => project)
    pr.priority = priority
    pr.save!

    # TODO: Now if there was a request for same gr and priority but diff proj,
    # remove it
    render :nothing => true, :status => 200
  end

  def get_matches
    @matches = {}
    not_matched = []
    remaining_groups = Group.all.to_a
    Project.all.each do |proj|
      requests = get_highest_priority_requests(proj)
      if requests.length > 1
        matches[proj] = get_highest_priority_group(requests)
        remaining_groups.delete(matches[proj])
      elsif requests.length == 1
        matches[proj] = requests[0].group
        remaining_groups.delete(matches[proj])
      else
        not_matched.append(proj)
      end
    end
    not_matched.all.each do |proj|
      matches[proj] = not_matched.pop
    end
    @matches
  end


  private
  def get_highest_priority_requests(proj)
    highest_priority = 0
    requests = []
    proj.requests.each do |req|
      if highest_priority > req.priority
        high_priority = req.priority
        requests = [req.group]
      elsif highest_priority == req.priority
        requests.append(req)
      end
    end
    groups
  end

  def get_highest_priority_group(requests)
    earliest_time = nil?
    earliest_group = nil?
    requests.all.each do |req|
      if earliest_time.nil?
        earliest_time = req.created_at
        earliest_group = req.group
      elsif earliest_time > req.time
        earliest_time = req.created_at
        earliest_group = req.group
      end
    end
    earliest_group
  end

end
