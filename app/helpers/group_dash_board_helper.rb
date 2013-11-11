module GroupDashBoardHelper
  def assignment_badge(assignment)
    if DateTime.now > assignment.due_date
      score, max_score = assignment.total_score
      if score.nil?
        haml_tag :span, :class => 'pull-right badge' do
          haml_concat("Not yet graded")
        end
      else
        haml_tag :span, :class => 'pull-right badge' do
          haml_concat("Score: #{score}/#{max_score}")
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
