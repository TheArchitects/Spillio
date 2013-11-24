class InstructorGroupDashBoardController < AuthenticatedController

  def set_group_size(size)
    Group.max_students = size
  end

  def set_group_instructor(instructor, group)
    group.instructor = instructor
    instructor.groups << group
  end

  def post_new_task(title, description, due_date)
    new_task = Task.create(:title=>title, :description=>description, :due_date=>due_date)
  end

  def assign_grade(assignment, score, max_score)
    new_score = Score.create(:max_score=>max_score,:score=>score)
    assignment.scores << new_score
  end
end
