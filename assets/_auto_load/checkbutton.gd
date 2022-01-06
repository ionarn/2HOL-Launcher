extends CheckButton


''' LOAD CHECKBUTTON STATE FROM INI '''
func load_ini(checkbutton_node, file_path, inverted = false):
	var file = File.new() # new file class on which you will call file class methods
	file.open(file_path, File.READ) # the file is now opened in the background
	checkbutton_node.pressed = flip(bool(int(file.get_as_text())), inverted)
	file.close()


''' SAVE CHECKBUTTON STATE TO INI '''
func save_ini(checkbutton_node, file_path, inverted = false):
	var file = File.new() # new file class on which you will call file class methods
	file.open(file_path, File.WRITE) # the file is now opened in the background
	file.store_string(str(int(flip(checkbutton_node.pressed, inverted))))
	file.close()


''' RESET CHECKBUTTON STATE TO DEFAULT '''
func reset(checkbutton_node, default_setting, inverted = false):
	checkbutton_node.pressed = flip(default_setting, inverted)


''' FLIP BOOLEAN STATE IF TRUE '''
func flip(boolean, inverted = false):
	if inverted == true:
		if boolean == true:
			boolean = false
			return boolean
		else:
			boolean = true
			return boolean
	else:
		return boolean


''' CHECK FOR RESET BUTTON VISIBILITY '''
func reset_button_visibility(checkbutton_node, reset_button, default_setting, inverted = false):
	if checkbutton_node.pressed == flip(default_setting, inverted):
		reset_button.get_node("reset").visible = false
	else:
		reset_button.get_node("reset").visible = true	
