extends SpinBox


''' LOAD SPINBOX VALUE FROM INI '''
func load_ini(spinbox_node, file_path):
	var file = File.new() # new file class on which you will call file class methods
	file.open(file_path, File.READ) # the file is now opened in the background
#	print("Loaded Spinbox Value of ", spinbox_node.owner.name, ": ", file.get_as_text())
	spinbox_node.value = float(file.get_as_text())
	file.close()


''' SAVE SPINBOX VALUE TO INI '''
func save_ini(spinbox_node, file_path):
	var file = File.new() # new file class on which you will call file class methods
	file.open(file_path, File.WRITE) # the file is now opened in the background
	file.store_string(str(spinbox_node.value))
	file.close()


''' CHECK FOR SPINBOX RESET BUTTON VISIBILITY '''
func reset_button_visibility(spinbox_node, reset_button, default_setting, ini_path):
	var file = File.new()
	file.open(ini_path, File.READ)
	if float(file.get_as_text()) == default_setting:
		reset_button.get_node("reset").visible = false
	else:
		reset_button.get_node("reset").visible = true


''' RESET SPINBOX TO DEFAULT VALUE '''
func reset_spinbox(spinbox_node, default_setting):
	spinbox_node.value = default_setting
