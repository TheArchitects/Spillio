class TasksController < AuthenticatedController

	def destroy
    if @authenticated_user.is_admin?
      task_id = params[:id]
      Task.find(task_id).destroy
      flash[:success]= "Assignment successfully deleted."
    end
    redirect_to :back
  end

end