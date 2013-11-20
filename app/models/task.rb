class Task < ActiveRecord::Base
  belongs_to :author, :class_name => "Instructor"
  has_many :assignments
  attr_accessible :title, :description, :due_date, :content

  # TODO: Remove once we have instructor functionality
  def self.mock_task_1
    unless defined? @@mock_task_1
      @@mock_task_1 = Task.create({
        title: "Ye olde iteration",
        description: "Lorem ipsum dolor sit amet, "*8,
        due_date: Date.parse('6-6-2006')
        })
    end
    @@mock_task_1
  end

  def self.mock_task_2
    unless defined? @@mock_task_2
      @@mock_task_2 = Task.create({
        title: "Upcoming iteration",
        description: "Anim pariatur cliche reprehenderit, "*8,
        due_date: Date.parse('6-6-2016')
        })
    end
    @@mock_task_2
  end
end