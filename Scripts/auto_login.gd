extends CheckButton

# Declare member variables here.
var default_setting = false
var file_path = "./settings/autoLogIn.ini" #have the file path
onready var checkbutton_node = get_tree().get_root().find_node('al_checkbutton', true, false)
onready var reset_button = get_tree().get_root().find_node('al_reset', true, false)
onready var checkbutton = get_tree().get_root().find_node('checkbutton', true, false)

# - - - - - - - - - - - - - - - - - - - - - -

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_button.connect('button_pressed', self, 'on_al_reset_pressed')
	checkbutton.load_ini(self, file_path)
	checkbutton.reset_button_visibility(self, reset_button, default_setting)


func _on_al_checkbutton_toggled(button_pressed):
	checkbutton.save_ini(self, file_path)
	checkbutton.reset_button_visibility(self, reset_button, default_setting)


func on_al_reset_pressed():
#	reset_value()
	checkbutton.reset(self, default_setting)
