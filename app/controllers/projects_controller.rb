class ProjectsController < AuthenticatedController
  # GET /projects
  # GET /projects.json
  def index
    @group_id = @authenticated_user.group.id
    @projects = Project.all
    @any_results = @projects.any?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    render :text => "Unimplemented"
    return

    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    render :text => "Unimplemented"
    return

    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    render :text => "Unimplemented"
    return

    @project = Project.find(params[:id])
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
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

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
        earliest_time = req.time
        earliest_group = req.group
      elsif earliest_time > req.time
        earliest_time = req.time
        earliest_group = req.group
      end
    end
    earliest_group
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
end
