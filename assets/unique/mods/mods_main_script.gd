extends Control

#var config = ConfigFile.new()
#var load_response = config.load(TL_Path.launcher_settings)

# Called when the node enters the scene tree for the first time.
func load_values():
	var file = File.new()
#	file.open(TL_Path.hetuw_minitech_game_file, File.READ)
	if file.file_exists(TL_Path.hetuw_minitech_game_file) == true and file.file_exists(TL_Path.hetuw_minitech_config_file) == true:
		TL_Node.mod_selection_dropdown.set_item_disabled(1, false)
	else:
		TL_Node.mod_selection_dropdown.set_item_disabled(1, true)
	TL_Node.mod_selection_dropdown.set_item_disabled(2, true)
	
	load_selected_mod()
	mod_settings_visibility(TL_Node.mod_selection_dropdown.selected)
#	file.open(TL_Path.hetuw_minitech_config_file, File.READ)
#	var array = []
#	while not file.eof_reached():
#		array.append(file.get_csv_line("\n"))
	if file.file_exists(TL_Path.hetuw_minitech_config_file):
		var hetuw_lines_array = read_hetuw_cfg()
		var assembled_text = ""
		var parsed_line = 0
		for line in hetuw_lines_array:
			parsed_line += 1
			assembled_text += line
			if hetuw_lines_array.size() != parsed_line:
				assembled_text += "\n"
		
		file.open("./hetuw2.cfg", File.WRITE)
		file.store_string(assembled_text)
		file.close()


func read_hetuw_cfg():
	var file = File.new()
	file.open(TL_Path.hetuw_minitech_config_file, File.READ)
	var hetuw_array = []
	while not file.eof_reached():
		hetuw_array.append(file.get_line())
	file.close()
	return hetuw_array


func load_selected_mod():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
#	if config.has_section("hetuw") == false:
#		config.set_value("hetuw", "mod_selected", 0)
#		config.save(TL_Path.launcher_settings)
#	else:
	TL_Node.mod_selection_dropdown.selected = int(config.get_value("launcher", "mod_selected"))


func mod_settings_visibility(selected_mod_index):
	var mod_list_array = [
			TL_Node.list_without_mods,
			TL_Node.list_hetuw_mod,
			TL_Node.list_day_cycle_mod
	]
	for node in mod_list_array:
		if selected_mod_index != mod_list_array.find(node):
			node.visible = false
		else:
			node.visible = true


func _on_mse_dropdown_item_selected(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	mod_settings_visibility(index)
	config.set_value("launcher", "mod_selected", index)
	config.save(TL_Path.launcher_settings)
