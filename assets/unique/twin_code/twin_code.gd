extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func load_value():
	$twc_hbox/twc_reset.connect("button_pressed", self, "_on_twc_reset_button_pressed")
	TL_LineEdit.load_ini($twc_hbox/twc_lineedit, TL_Path.twin_code, TL_Default.twin_code)
	TL_LineEdit.reset_button_visibility($twc_hbox/twc_lineedit, $twc_hbox/twc_reset, TL_Default.twin_code)


func _on_twc_lineedit_text_changed(_new_text):
	if TL_Variables.startup_load_finished == true:
		TL_LineEdit.save_ini($twc_hbox/twc_lineedit, TL_Path.twin_code)
#		TL_LineEdit.reset_button_visibility($twc_hbox/twc_lineedit, $twc_hbox/twc_reset, TL_Default.twin_code)
	TL_LineEdit.reset_button_visibility($twc_hbox/twc_lineedit, $twc_hbox/twc_reset, TL_Default.twin_code)


func _on_twc_reset_button_pressed():
	TL_LineEdit.reset($twc_hbox/twc_lineedit, TL_Default.twin_code)
	TL_LineEdit.save_ini($twc_hbox/twc_lineedit, TL_Path.twin_code)
	TL_LineEdit.reset_button_visibility($twc_hbox/twc_lineedit, $twc_hbox/twc_reset, TL_Default.twin_code)
