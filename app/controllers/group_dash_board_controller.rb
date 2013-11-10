class GroupDashBoardController < AuthenticatedController

	#assumption: When directing to the group dash board
	#you set :id to authenticated_user.group
	#display all the info of the group that belongs to
	#authenticated user
	def show
		group_id = @authenticated_user.group
		if group_id == params[:id]
			@group = Group.find[group_id]
		else
			flash[:notice] = 'You are not allowed to check this group :)'
		end
	end
	
	#Submits the submission content 
	def submit_assignment

	end

	#Creates a new post for the specified assignment
	def create_post

	end




end
