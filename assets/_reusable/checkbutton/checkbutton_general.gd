tool
extends HBoxContainer

signal on_value_changed

''' V A R I A B L E S '''

var default_setting
var ini_path

export(String) var CheckButton_Text = "VSync" setget checkbutton_text_set, checkbutton_text_get
export(String) var variable_name_code
export(bool) var invert_bool = false
export(String, MULTILINE) var tooltip = ""


#	-------------------------------------------------------

''' F U N C T I O N S '''

''' ON PROGRAM START '''
func load_value():
# warning-ignore:return_value_discarded
	$gcb_reset.connect('button_pressed', self, 'on_reset_button_pressed')
	default_setting = bool(TL_Func.exec("TL_Default." + variable_name_code))
	ini_path = TL_Func.exec("TL_Path." + variable_name_code) #have the file path
	
	TL_CheckButton.load_ini($gcb_checkbutton, ini_path, invert_bool)
	TL_CheckButton.reset_button_visibility($gcb_checkbutton, $gcb_reset, default_setting, invert_bool)
#	$gcb_checkbutton.hint_tooltip = tooltip


''' EXPORT TOOL: SET CHECKBUTTON_TEXT '''
func checkbutton_text_set(text):
	CheckButton_Text = text
	var checkbutton = $gcb_checkbutton
	if checkbutton:
		checkbutton.text = text


''' EXPORT TOOL: GET CHECKBUTTON_TEXT '''
func checkbutton_text_get():
	return CheckButton_Text


''' ON CHECKBUTTON TOGGLED '''
func _on_gcb_checkbutton_toggled(_button_pressed):
	TL_CheckButton.save_ini($gcb_checkbutton, ini_path, invert_bool)
	TL_CheckButton.reset_button_visibility($gcb_checkbutton, $gcb_reset, default_setting, invert_bool)
	emit_signal("on_value_changed")


''' ON RESET BUTTON PRESSED '''
func on_reset_button_pressed():
	TL_CheckButton.reset($gcb_checkbutton, default_setting, invert_bool)


func _on_gcb_checkbutton_mouse_entered():
	var tween = $gcb_tween
	var normal_style = $gcb_checkbutton.get_stylebox("normal")
	var pressed_style = $gcb_checkbutton.get_stylebox("pressed")
	var hover_pressed_style = $gcb_checkbutton.get_stylebox("hover_pressed")
	var hover = $gcb_checkbutton.get_stylebox("hover")
	print("STYLEBOX: " + str(normal_style))
	tween.interpolate_property(normal_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0), Color(0.6, 0.6, 0.6, 0.039216), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(hover, "bg_color",
			Color(0.6, 0.6, 0.6, 0), Color(0.6, 0.6, 0.6, 0.039216), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(pressed_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0), Color(0.6, 0.6, 0.6, 0.039216), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_pressed_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0), Color(0.6, 0.6, 0.6, 0.039216), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()


func _on_gcb_checkbutton_mouse_exited():
	var tween = $gcb_tween
	var normal_style = $gcb_checkbutton.get_stylebox("normal")
	var pressed_style = $gcb_checkbutton.get_stylebox("pressed")
	var hover_pressed_style = $gcb_checkbutton.get_stylebox("hover_pressed")
	var hover = $gcb_checkbutton.get_stylebox("hover")
	tween.interpolate_property(normal_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0.039216), Color(0.6, 0.6, 0.6, 0), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(hover, "bg_color",
			Color(0.6, 0.6, 0.6, 0.039216), Color(0.6, 0.6, 0.6, 0), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(pressed_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0.039216), Color(0.6, 0.6, 0.6, 0), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_pressed_style, "bg_color",
			Color(0.6, 0.6, 0.6, 0.039216), Color(0.6, 0.6, 0.6, 0), 0.33,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()


func _on_gcb_tween_tween_completed(object, key):
	pass # Replace with function body.
