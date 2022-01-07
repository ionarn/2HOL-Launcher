extends MarginContainer

''' V A R I A B L E S '''

var resource_array

#	-------------------------------------------------------

''' F U N C T I O N S '''

''' ON PROGRAM START '''
func load_values():
	TL_Node.gen_groupbox.connect('unfold_pressed', self, 'on_vid1_unfold_pressed')
	resource_array = [
		{"Node": TL_Node.auto_login, "default_value": TL_Default.auto_login, "Type": "checkbutton"},
		{"Node": TL_Node.hard_to_quit, "default_value": TL_Default.hard_to_quit, "Type": "checkbutton"},
		{"Node": TL_Node.check_spelling, "default_value": TL_Default.check_spelling, "Type": "checkbutton"},
		{"Node": TL_Node.live_triggers, "default_value": TL_Default.live_triggers, "Type": "checkbutton"},
		{"Node": TL_Node.tutorial_done, "default_value": TL_Default.tutorial_done, "Type": "checkbutton"},
		{"Node": TL_Node.pause_on_minimize, "default_value": TL_Default.pause_on_minimize, "Type": "checkbutton"},
		{"Node": TL_Node.cursor_speed, "default_value": TL_Default.cursor_speed, "Type": "spinbox"},
	]
	for node in TL_Variables.resource_array:
		node["Node"].connect("on_value_changed", self, "_on_value_change")
	$gen_groupbox.connect("reset_pressed", self, "_general_reset_pressed")
	reset_button_visibility()


''' HIDE/SHOW CATEGORY CONTENTS '''
func on_vid1_unfold_pressed():
	TL_Node.accordion_menu.collapse(TL_Node.gen_margin, TL_Node.gen_groupbox)


''' RESET ALL SETTINGS IN GENERAL '''
func _general_reset_pressed():
	for node in TL_Variables.resource_array:
		if "checkbutton" in node["Type"]:
			TL_CheckButton.reset(node["Node"].get_node("gcb_checkbutton"), bool(node["default_value"]), node["Node"].invert_bool)
		elif "spinbox" in node["Type"]:
			TL_SpinBox.reset_spinbox(node["Node"].get_node("gsb_spinbox"), float(node["default_value"]))
	reset_button_visibility()


''' RESET BUTTON VISIBILITY '''
func reset_button_visibility():
	for node in TL_Variables.resource_array:
		if "checkbutton" in node["Type"]:
			if bool(node["Node"].get_node("gcb_checkbutton").pressed) != bool(node["default_value"]):
				$gen_groupbox/MarginContainer/HBox_Video/name_reset/reset.visible = true
				break
			else:
				if TL_Variables.resource_array.find(node) == (TL_Variables.resource_array.size() - 1):
					$gen_groupbox/MarginContainer/HBox_Video/name_reset/reset.visible = false
		elif "spinbox" in node["Type"]:
			if float(node["Node"].get_node("gsb_spinbox").value) != float(node["default_value"]):
				$gen_groupbox/MarginContainer/HBox_Video/name_reset/reset.visible = true
				break
			else:
				if TL_Variables.resource_array.find(node) == (TL_Variables.resource_array.size() - 1):
					$gen_groupbox/MarginContainer/HBox_Video/name_reset/reset.visible = false


''' ON VALUE CHANGE CHECK RESET BUTTON VISIBILITY '''
func _on_value_change():
	reset_button_visibility()
