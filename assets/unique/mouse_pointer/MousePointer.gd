extends HBoxContainer

func load_value():
	TL_Node.mousepointer_reset.connect('button_pressed', self, 'on_mousepointer_reset_pressed') # When 
	
	mousepointer_load_value()
	mousepointer_reset_button_visibility()


''' ON MOUSE POINTER MODE SELECTED '''
func _on_mp_dropdown_item_selected(_index):
	mousepointer_save_value()
	mousepointer_reset_button_visibility()


''' ON MOUSE POINTER RESET BUTTON PRESSED '''
func on_mousepointer_reset_pressed():
	mousepointer_default_value()
	mousepointer_reset_button_visibility()
	mousepointer_save_value()

#	--------------------------------------------------------

''' LOAD MOUSE POINTER MODE SELECTION '''
func mousepointer_load_value():
	var file = File.new()  #new file class on which you will call file class methods
	file.open(TL_Path.mouse_pointer, File.READ)  #the file is now opened in the background
	TL_Node.mousepointer_dropdown.selected = int(file.get_as_text())
	file.close()


''' SAVE MOUSE POINTER MODE SELECTION '''
func mousepointer_save_value():
	if TL_Variables.startup_load_finished == true:
		var file = File.new()  #new file class on which you will call file class methods
		file.open(TL_Path.mouse_pointer, File.WRITE)  #the file is now opened in the background
		file.store_string(str(TL_Node.mousepointer_dropdown.selected))
		file.close()


''' RESET MOUSE POINTER MODE TO DEFAULT '''
func mousepointer_default_value():
	TL_Node.mousepointer_dropdown.select(TL_Default.mousepointer)


''' MOUSE POINTER RESET BUTTON VISIBILITY '''
func mousepointer_reset_button_visibility():
	if TL_Node.mousepointer_dropdown.selected == TL_Default.mousepointer:
		TL_Node.mousepointer_reset.get_node("reset").visible = false
	else:
		TL_Node.mousepointer_reset.get_node("reset").visible = true
