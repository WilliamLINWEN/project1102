module ChatroomsHelper
	def options_for_main_category
		options_for_select(@categories.collect{ |c| [c.name, c.id]}, @sub_categories.first.parent.id)
	end
end
