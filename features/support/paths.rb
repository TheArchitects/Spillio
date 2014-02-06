# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the group dashboard page for group id "(.*)"$/
      group_path($1)

    when /^the group dashboard page for cid "(.*)"$/
      group_path(Student.find_by_cid($1).group_id)

    when /^the group dashboard page for "(.*)"$/
      group_path(Student.find_by_name($1).group_id)

    when /^the profile page (?:for|of) "(.*)"$/i
      student_path(Student.find_by_name($1))

    when /^the admin group management page$/i
      "/admin/?page=gm"

    when /^the admin assignment management page$/i
      "/admin/?page=am"

    when /^the admin project management page$/i
      "/admin/?page=pm"

    when /^the search for students page$/
      student_search_path

    when /^the home page$/
      root_path

    when /^the projects page$/
      projects_path

    when /^the admin panel page$/
      admin_path
    when /^the new user profile page for "(.*)"$/
      student_path(Student.find_by_name($1))

    when /^the create new student profile page$/
      new_student_path
    when /^the edit student profile page of "(.*)"$/
      edit_student_path(Student.find_by_name($1))
    when /^the user profile page (?:for|of) "(.*)"$/
      student_path(Student.find_by_name($1))
    when /the view my groups page$/
      my_groups_path


    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
