Given /settings set/ do
	Setting.create(max_group_size: 3)	
end

Given /the group size is (\d*)/ do |size|
	setting = Setting.first
	setting.max_group_size = size
	setting.save
end