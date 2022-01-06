tool
extends HBoxContainer

signal on_value_changed

''' V A R I A B L E S '''

onready var default_setting = TL_Func.exec("TL_Default." + variable_name_code)
onready var ini_path = TL_Func.exec("TL_Path." + variable_name_code) #have the file path

export(String) var label_text = "Spinbox Tool" setget set_label_text, get_label_text
export(String) var variable_name_code = "Name Code"
export(float) var spinbox_value = 0 setget set_spinbox_value, get_spinbox_value
export(String) var prefix = "" setget set_prefix, get_prefix
export(String) var suffix = "" setget set_suffix, get_suffix
export(float) var min_value = 0 setget set_min_value, get_min_value
export(float) var max_value = 100 setget set_max_value, get_max_value
export(float) var step = 1 setget set_step, get_step
export(bool) var rounded = false setget set_rounded, get_rounded
export(String, MULTILINE) var tooltip = ""

#	-------------------------------------------------------

''' F U N C T I O N S '''

''' ON PROGRAM START '''
func _ready():
#	warning-ignore:return_value_discarded
	$gsb_reset.connect("button_pressed", self, "_on_reset_button_pressed")
	$gsb_spinbox.hint_tooltip = tooltip
	$gsb_label.hint_tooltip = tooltip
	TL_Signal.emit_signal("ready_load_spinbox", $gsb_spinbox, ini_path, $gsb_reset, TL_Func.exec("TL_Default." + variable_name_code))


''' EXPORT TOOL: SET LABEL_TEXT '''
func set_label_text(new_text):
	label_text = new_text
	var label = $gsb_label
	if label:
		label.text = new_text


''' EXPORT TOOL: GET LABEL_TEXT '''
func get_label_text():
	return label_text


''' EXPORT TOOL: SET SPINBOX_VALUE '''
func set_spinbox_value(new_value):
	spinbox_value = float(new_value)
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.value = float(new_value)


''' EXPORT TOOL: GET SPINBOX_VALUE '''
func get_spinbox_value():
	return float(spinbox_value)


''' EXPORT TOOL: SET PREFIX '''
func set_prefix(new_text):
	prefix = new_text
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.prefix = new_text


''' EXPORT TOOL: GET PREFIX '''
func get_prefix():
	return prefix


''' EXPORT TOOL: SET SUFFIX '''
func set_suffix(new_text):
	suffix = new_text
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.suffix = new_text


''' EXPORT TOOL: GET SUFFIX '''
func get_suffix():
	return suffix


func set_min_value(new_value):
	min_value = new_value
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.min_value = new_value


func get_min_value():
	return min_value


func set_max_value(new_value):
	max_value = new_value
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.max_value = new_value


func get_max_value():
	return max_value


func set_step(new_value):
	step = new_value
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.step = new_value


func get_step():
	return step


func set_rounded(new_value):
	rounded = new_value
	var spinbox = $gsb_spinbox
	if spinbox:
		spinbox.rounded = new_value


func get_rounded():
	return rounded


''' ON SPINBOX VALUE CHANGED '''
func _on_gsb_spinbox_value_changed(value):
	TL_SpinBox.save_ini($gsb_spinbox, ini_path)
	TL_SpinBox.reset_button_visibility($gsb_spinbox, $gsb_reset, float(TL_Func.exec("TL_Default." + variable_name_code)), ini_path)
	emit_signal("on_value_changed")


''' ON RESET BUTTON PRESSED '''
func _on_reset_button_pressed():
	TL_SpinBox.reset_spinbox($gsb_spinbox, TL_Func.exec("TL_Default." + variable_name_code))
#	TL_SpinBox.reset_button_visibility($gsb_spinbox, $gsb_reset, float(TL_Func.exec("TL_Default." + variable_name_code)))
