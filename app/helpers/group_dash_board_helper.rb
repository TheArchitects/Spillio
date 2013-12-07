module GroupDashBoardHelper
  def assignment_badge(assignment)
    if DateTime.now > assignment.due_date
      grade, max_grade = assignment.grade, assignment.max_grade
      if grade.nil? || grade == -1
        haml_tag :span, :class => 'pull-right badge' do
          haml_concat("Not yet graded")
        end
      else
        haml_tag :span, :class => 'pull-right badge' do
          haml_concat("Score: #{grade}/#{max_grade}")
        end
      end
    else
      formatted_date = assignment.due_date.strftime('%a, %d/%b/%Y')
      haml_tag :span, :class => 'pull-right badge' do
        haml_concat("Due on #{formatted_date}")
      end
    end
  end
end
