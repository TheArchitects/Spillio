class GroupDashBoardController < AuthenticatedController

	#assumption: When directing to the group dash board
	#you set :id to authenticated_user.group
	#display all the info of the group that belongs to
	#authenticated user
	def show
		group_id = @authenticated_user.group.id

		if group_id.to_s == params[:id]
			@group = Group.find(group_id)
		else
			flash[:notice] = 'You are not allowed to check this group :)'
		end
	end

	#Submits the submission content
	def submit_assignment
		submission_id = params[:id]

		if Submission.exists?(submission_id)
			submission = Submission.find(submission_id)
			submission.content = params[:submission][:content]
			submission.submitted_date = DateTime.now
			submission.save
			group_id = submission.group_id
			redirect_to group_db_show_url(group_id)
			return
		end

		render text: "Sad panda. You tried to do something weird"

		# TODO Do proper Sad path
	end

	#Creates a new post for the specified assignment
	def create_post
		assignment_id = params[:assignment_id]

		if Assignment.exists?(assignment_id)
			assignment = Assignment.find(assignment_id)
			post = Post.create({
				content: params[:content],
				date: DateTime.now
				})

			assignment.posts << post
			assignment.save

			post.user = @authenticated_user
			post.save

			group_id = assignment.group_id
			redirect_to group_db_show_url(group_id)
			return
		end

		render text: "Sad panda. You tried to do something weird"

		# TODO Do proper Sad path
	end




end
