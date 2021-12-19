tool
extends HBoxContainer

''' V A R I A B L E S '''

#onready var default_setting = bool(TL_Func.exec("TL_Default." + variable_name_code))
#onready var ini_path = TL_Func.exec("TL_Path." + variable_name_code) #have the file path

export(String) var CheckButton_Text setget set_checkbutton_text, get_checkbutton_text
export(String) var variable_name_code
export(bool) var invert_bool = false
export(String, MULTILINE) var tooltip
var hetuw_setting_index = 0

#	-------------------------------------------------------

''' F U N C T I O N S '''


func _ready():
#	var hetuw_array = read_hetuw_cfg()
	for item in TL_Variables.hetuw_setting_list:
		if item["variable_name_code"] == variable_name_code:
			break
		hetuw_setting_index += 1
	print("index in the List: ", TL_Variables.hetuw_setting_list[hetuw_setting_index])


''' EXPORT TOOL: SET CHECKBUTTON_TEXT '''
func set_checkbutton_text(new_text):
	CheckButton_Text = new_text
	var checkbutton = $hcb_checkbutton
	if checkbutton:
		checkbutton.text = new_text


''' EXPORT TOOL: GET CHECKBUTTON_TEXT '''
func get_checkbutton_text():
	return CheckButton_Text


''' READ HETUW CFG FILE AND RETURN ARRAY WITH LINES OF TEXT '''
func read_hetuw_cfg():
	var file = File.new()
	file.open(TL_Path.hetuw_minitech_config_file, File.READ)
	var hetuw_array = []
	while not file.eof_reached():
		hetuw_array.append(file.get_line())
	file.close()
	return hetuw_array


''' ON CHECKBUTTON TOGGLED '''
func _on_gcb_checkbutton_toggled(_button_pressed):
	var hetuw_lines_array = read_hetuw_cfg()
	var key_name = TL_Variables.hetuw_setting_list[hetuw_setting_index]["key_name"]
	
	var parsed_line = 0
	for line in hetuw_lines_array:
		if key_name in line:
			break
		parsed_line += 1
	
	hetuw_lines_array[parsed_line] = key_name + " = " + str(int($hcb_checkbutton.pressed)) + TL_Variables.hetuw_setting_list[hetuw_setting_index]["info"]
	
	var assembled_text = ""
	parsed_line = 0
	for line in hetuw_lines_array:
		parsed_line += 1
		assembled_text += line
		if hetuw_lines_array.size() != parsed_line:
			assembled_text += "\n"
	var file = File.new()
	file.open("./hetuw2.cfg", File.WRITE)
	file.store_string(assembled_text)
	file.close()
