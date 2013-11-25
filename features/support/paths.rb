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

    when /^the group dashboard page for "(.*)"$/
      group_db_show_path(User.find_by_name($1).group_id)

    when /^the group dashboard page for cid "(.*)"$/
      group_db_show_path(User.find_by_cid($1).group_id)

    when /^my group dashboard page$/
      group_db_show_path(User.find_by_name($1).group_id)

    # it wouldnt surprise me if the following 4 paths are the same
    # TODO: check it and remove some of them if so
    when /^the View Profile Page for "(.+)"$/
      "/students/#{Student.find_by_name($1).id}"

    when /^the New User Profile page for "(.+)"$/
      "/students/#{Student.find_by_name($1).id}"

    when /^the User Profile page of "(.*)"$/
      student_path(Student.find_by_name($1))

    when /^the profile page of "(.*)"$/
      student_path(Student.find_by_name($1))

    when /^the Search for Students Page$/
      student_search_path

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
