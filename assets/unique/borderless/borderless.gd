extends HBoxContainer

''' VARIABLES '''
var default_setting = true
var file_path = "./settings/borderless.ini" #have the file path
onready var check_button = get_tree().get_root().find_node('bl_checkbutton', true, false)
onready var reset_button = get_tree().get_root().find_node('bl_reset', true, false)

#	-------------------------------------------------------

''' F U N C T I O N S '''

''' ON PROGRAM START '''
func _ready():
	reset_button.connect('button_pressed', self, 'on_mousepointer_reset_pressed')
	borderless_load_value()
	borderless_reset_button_visibility()


''' ON BORDERLESS SETTING TOGGLED '''
func _on_cBtn_Borderless_toggled(_button_pressed):
	borderless_save_value()
	borderless_reset_button_visibility()


''' ON BORDERLESS RESET PRESSED '''
func on_mousepointer_reset_pressed():
	borderless_reset_to_default()

#	-------------------------------------------------------

''' LOAD BORDERLESS SELECTION STATE '''
func borderless_load_value():
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,File.READ)  #the file is now opened in the background
	check_button.pressed = bool(int(file.get_as_text()))
	file.close()


''' SAVE BORDERLESS SELECTION STATE '''
func borderless_save_value():
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path, file.WRITE)  #the file is now opened in the background
	file.store_string(str(int(check_button.pressed)))
	file.close()


''' RESET BORDERLESS SELECTION STATE TO DEFAULT '''
func borderless_reset_to_default():
	check_button.pressed = default_setting


''' BORDERLESS RESET BUTTON VISIBILTY '''
func borderless_reset_button_visibility():
	if check_button.pressed == default_setting:
		reset_button.get_node("reset").visible = false
	else:
		reset_button.get_node("reset").visible = true
