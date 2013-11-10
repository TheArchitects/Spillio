class Assignment < ActiveRecord::Base
	belongs_to :instructor
	has_and_belongs_to_many :groups
	has_many :scores
	has_many :submissions
	has_many :posts
	attr_accessible :title, :description, :due_date


  # TODO: Remove once we have instructor functionality
  def self.mock_assignment_1
    unless defined? @@mock_assignment_1
      @@mock_assignment_1 = Assignment.create({
        title: "Ye olde iteration",
        description: "Lorem ipsum dolor sit amet, "*8,
        due_date: Date.parse('6-6-2006')
        })
    end
    @@mock_assignment_1
  end

  def self.mock_assignment_2
    unless defined? @@mock_assignment_2
      @@mock_assignment_2 = Assignment.create({
        title: "Upcoming iteration",
        description: "Anim pariatur cliche reprehenderit, "*8,
        due_date: Date.parse('6-6-2016')
        })
    end
    @@mock_assignment_2
  end

end
