class GroupJoinController < AuthenticatedController
  def create
    type = params[:request_type]

    from = @authenticated_user
    to = Student.find(params[:requestee])

    case type
    when 'invite'
      # from a student to a student
      forge_request('invite', from, to)
      flash[:success] = "Request sent to #{to.name}"
    when 'merge'
      # from a group to a group
      forge_request('merge', from, to)
      flash[:success] = "Merge request sent to #{to.name}"
    when 'join'
      # from a student to a group
      forge_request('join', from, to)
      flash[:success] = "Invitation sent to #{to.name}"
    else
      flash[:error] = "I did not understand your request!"
    end

    redirect_to :back
  end

  def accept
    req = GroupJoinRequest.find(params[:id])

    type = req.request_type

    if @authenticated_user.id == req.requestee.id

      case type
      when 'invite'
        # from a student to a student
        accept_join(req, true)
      when 'merge'
        # from a group to a group
        accept_merge(req)
      when 'join'
        # from a student to a group
        accept_join(req, false)
      end
    end
  end



private

  def forge_request(type, from, to)
    if from && to
      req = GroupJoinRequest.create
      req.requester = from
      req.requestee = to
      req.request_type = type
      req.save
    end
  end

  def accept_join(req, reverse)
    old_group_id = req.requester.group_id
    Group.delete_if_empty old_group_id

    if (reverse)
      req.requestee.group_id = req.requester.group_id
      req.requestee.save
    else
      req.requester.group_id = req.requestee.group_id
      req.requester.save
    end

    req.destroy

    @authenticated_user.reload
    redirect_to group_db_show_path(@authenticated_user.group_id)
  end

  def accept_merge(req)
    group1_id = req.requester.group_id
    group2_id = req.requestee.group_id

    merged_group_id = Group.merge_groups(group1_id,group2_id)

    if merged_group_id
      flash[:success] = "Groups merged"
      redirect_to group_db_show_path merged_group_id
    else
      flash[:error] = "Maximum size exceded"
      redirect_to :back
    end

    req.destroy

  end




end
