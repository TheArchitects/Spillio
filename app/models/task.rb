class Task < ActiveRecord::Base
  has_many :assignments
  attr_accessible :id, :title, :description, :due_date

  def assign_to_all_groups(max_grade, submission_types, submission_labels)
    Group.all.each do |group|
      assignment = Assignment.create_from_group_and_task(group, self)
      assignment.max_grade = max_grade
      assignment.save

      0.upto(submission_types.length-1) do |i|
        label = submission_labels[i]
        type = submission_types[i]
        if not label.empty?
          submission = Submission.create!(:label => label, :subm_type => type)
          submission.assignment = assignment
          submission.save
        end
      end
    end
  end

  def to_csv hostname
    assignments_tabel = self.build_full_assignments_list

    CSV.generate do |csv|
      csv << ["Class Account","Student Name","Link to Submission"]+assignments_tabel.first[:submissions].map { |sub| sub[:label] }
      assignments_tabel.each do |assignment|
        csv << [assignment[:members].map { |s| "#{s}" }.join(', '),
                assignment[:group_name],
                Rails.application.routes.url_helpers.task_submitions_url(self.id, host: hostname)+"#group-assignment-"+assignment[:id].to_s
                ]+assignment[:submissions].sort{|a, b| a[:created_at] <=> b[:created_at]}.map { |sub| sub[:content] }
      end
    end
  end

  def build_full_assignments_list
    assignments_tabel = []
    sorted_assignments = assignments.sort{|a,b| a.submissions.order("updated_at DESC").first.updated_at <=> b.submissions.order("updated_at DESC").first.updated_at}
    sorted_assignments.each do |assignment|
      assignment_map = {id: assignment.id, 
                        group_name: assignment.group.group_name, 
                        members: assignment.group.students.map {|stu| stu.class_account},
                        submissions: assignment.submissions.map { |sub| {label: sub.label, content: sub.content, created_at: sub.created_at.nsec}}
                      }
      assignments_tabel << assignment_map
    end

    return assignments_tabel
  end
end