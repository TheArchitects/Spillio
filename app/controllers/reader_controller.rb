class ReaderController < AuthenticatedController

	def my_groups
		@any_results = true
		@groups = Group.all.select{ |group|
			(not group.reader.nil?)	and (group.reader.id == @authenticated_user.id)
		}
		if @groups.empty?
			@any_results = false
		end
	end

end