class GroupDashBoardController < AuthenticatedController

	#assumption: When directing to the group dash board
	#you set :id to authenticated_user.group
	#display all the info of the group that belongs to
	#authenticated user
	def show
		@group = Group.find_by_id(params[:id])
		if @authenticated_user.class == Admin or
			(@authenticated_user == @group.reader)
			group_id = params[:id]
			@edit_mode = true
		else
			group_id = (@authenticated_user.group.id if (not @authenticated_user.group.nil?)) || nil;
			@edit_mode = false
		end

		if group_id.nil? or group_id.to_s != params[:id]
			flash[:warning] = 'You are not allowed to check this group :)'
			redirect_to student_path @authenticated_user
			return
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
			group_id = submission.assignment.group_id
			redirect_to group_db_show_url(group_id)
			return
		end

	end

	def save_grade
        assignment = Assignment.find(params[:assignment_id])
		if eligible_to_grade? assignment
			assignment.grade = params[:grade]
			assignment.ta_feedback = params[:feedback]
			assignment.save
			group_id = assignment.group_id
			flash[:success] = "Grade has been saved."
			redirect_to group_db_show_url(group_id)
	    end
  	end

	#Creates a new post for the specified assignment
	def create_post
		assignment_id = params[:assignment_id]

		assignment = Assignment.find(assignment_id)
		group_id = assignment.group_id

		if @authenticated_user.class != Admin
			post = Post.create({
				content: params[:content],
				published_at: DateTime.now
				})

			assignment.posts << post
			assignment.save

			post.author = @authenticated_user
			post.save

			redirect_to group_db_show_url(group_id)
			return
		else
			flash[:info] = "Admin can not post here."
			redirect_to group_db_show_url(group_id)
			return
		end

	end

private
	def eligible_to_grade? assignment
		group_id = assignment.group_id
		(@authenticated_user.class == Admin) or
		(@authenticated_user == Group.find_by_id(group_id).reader)
	end
end
