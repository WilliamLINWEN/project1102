module HomeHelper
	def random_panel_class
		panel_class = ['panel panel-success', 'panel panel-info', 'panel panel-warning', 'panel panel-danger']
		panel_class[Random.new.rand(3)]
	end
end
