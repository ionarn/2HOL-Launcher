extends HBoxContainer

''' ON PROGRAM START '''
func _ready():
	TL_Node.fullscreen_reset.connect('button_pressed', self, 'on_fs_reset_pressed')
	TL_CheckButton.load_ini(TL_Node.fullscreen_checkbutton, TL_Path.fullscreen)
	TL_CheckButton.reset_button_visibility(TL_Node.fullscreen_checkbutton, TL_Node.fullscreen_reset, bool(TL_Default.fullscreen))


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
		TL_Node.resolution_multi.modulate = Color(0.819608, 0.819608, 0.819608, 0.2)
		TL_Node.resolution_le_y.editable = false
		TL_Node.resolution_dropdown.disabled = true
	else:
		TL_Node.resolution_label.modulate = Color(0.819608, 0.819608, 0.819608)
		TL_Node.resolution_le_x.editable = true
		TL_Node.resolution_multi.modulate = Color(0.819608, 0.819608, 0.819608)
		TL_Node.resolution_le_y.editable = true
		TL_Node.resolution_dropdown.disabled = false
