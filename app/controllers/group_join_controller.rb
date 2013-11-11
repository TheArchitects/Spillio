class GroupJoinController < AuthenticatedController
	def create
		requestee = Student.find(params[:requestee])
		group_id = requestee.group_id
		requester = @authenticated_user
		if requestee && group_id && requester
			req = GroupJoinRequest.create
			req.requestee = params[:requestee]
			req.requester = requester.id
			req.group_id = group_id
			req.save
		end
		redirect_to :back
	end

	def accept
		req = GroupJoinRequest.find(params[:id])
		if req && @authenticated_user.id == req.requestee
			requester = Student.find(req.requester)
			requester.group_id = req.group_id
			req.destroy
		end
		redirect_to :back
	end
end
