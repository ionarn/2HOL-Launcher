extends HBoxContainer


''' ON PROGRAM START '''
func _ready():
	pass
#	TL_Node.fullscreen_reset.connect('button_pressed', self, 'on_fs_reset_pressed')


''' ON PROGRAM START '''
func load_value():
	TL_Node.fullscreen_reset.connect('button_pressed', self, 'on_fs_reset_pressed')
	
	var file = File.new()
	if file.file_exists(TL_Path.fullscreen) == true:
		TL_CheckButton.load_ini(TL_Node.fullscreen_checkbutton, TL_Path.fullscreen)
		TL_CheckButton.reset_button_visibility(TL_Node.fullscreen_checkbutton, TL_Node.fullscreen_reset, bool(TL_Default.fullscreen))
	else:
		TL_Node.fullscreen_checkbutton.disabled = true
	file.close()


''' ON FULLSCREEN SETTING TOGGLED '''
func _on_fs_checkbutton_toggled(_button_pressed):
	fs_disable_nodes()
	TL_CheckButton.save_ini(TL_Node.fullscreen_checkbutton, TL_Path.fullscreen)
	TL_CheckButton.reset_button_visibility(TL_Node.fullscreen_checkbutton, TL_Node.fullscreen_reset, bool(TL_Default.fullscreen))


''' ON FULLSCREEN RESET PRESSED '''
func on_fs_reset_pressed():
	TL_CheckButton.reset(TL_Node.fullscreen_checkbutton, bool(TL_Default.fullscreen))

#	--------------------------------

''' DISABLE AND ENABLE RESOLUTION CONTROLS '''
func fs_disable_nodes():
	if TL_Node.fullscreen_checkbutton.pressed == true:
		TL_Node.resolution_label.modulate = Color(0.819608, 0.819608, 0.819608, 0.2)
		TL_Node.resolution_le_x.editable = false
		TL_Node.resolution_le_x.mouse_filter = 2
		TL_Node.resolution_multi.modulate = Color(0.819608, 0.819608, 0.819608, 0.2)
		TL_Node.resolution_le_y.editable = false
		TL_Node.resolution_le_y.mouse_filter = 2
		TL_Node.resolution_dropdown.disabled = true
		TL_Node.resolution_dropdown.mouse_filter = 2
	else:
		TL_Node.resolution_label.modulate = Color(0.819608, 0.819608, 0.819608)
		TL_Node.resolution_le_x.editable = true
		TL_Node.resolution_le_x.mouse_filter = 0
		TL_Node.resolution_multi.modulate = Color(0.819608, 0.819608, 0.819608)
		TL_Node.resolution_le_y.editable = true
		TL_Node.resolution_le_y.mouse_filter = 0
		TL_Node.resolution_dropdown.disabled = false
		TL_Node.resolution_dropdown.mouse_filter = 0
