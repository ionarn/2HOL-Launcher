tool
extends HBoxContainer

signal on_value_changed

''' V A R I A B L E S '''

onready var default_setting = bool(TL_Func.exec("TL_Default." + variable_name_code))
onready var ini_path = TL_Func.exec("TL_Path." + variable_name_code) #have the file path

export(String) var CheckButton_Text = "VSync" setget checkbutton_text_set, checkbutton_text_get
export(String) var variable_name_code
export(bool) var invert_bool = false
export(String, MULTILINE) var tooltip


#	-------------------------------------------------------

''' F U N C T I O N S '''

''' ON PROGRAM START '''
func _ready():
#	warning-ignore:return_value_discarded
	print("INI PATH: ", ini_path, ", VARIABLE NAME CODE: ", variable_name_code)
	$gcb_reset.connect('button_pressed', self, 'on_reset_button_pressed')
	TL_Signal.emit_signal("ready_load_checkbutton", $gcb_checkbutton, $gcb_reset, ini_path, default_setting, invert_bool)
	$gcb_checkbutton.hint_tooltip = tooltip
	print("INI PATH: ", ini_path, ", VARIABLE NAME CODE: ", variable_name_code)


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
func _on_gcb_checkbutton_toggled(button_pressed):
	TL_CheckButton.save_ini($gcb_checkbutton, ini_path, invert_bool)
	TL_CheckButton.reset_button_visibility($gcb_checkbutton, $gcb_reset, default_setting, invert_bool)
	emit_signal("on_value_changed")


''' ON RESET BUTTON PRESSED '''
func on_reset_button_pressed():
	TL_CheckButton.reset($gcb_checkbutton, default_setting, invert_bool)
