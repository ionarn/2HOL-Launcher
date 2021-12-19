extends HBoxContainer

var font_res_default = preload("res://Themes/Fonts/thol_launcher_default_font.tres")
var font_res_groupbox = preload("res://Themes/Fonts/thol_launcher_groupbox_font.tres")
var font_res_lineedit = preload("res://Themes/Fonts/thol_launcher_lineedit_font.tres")
var font_res_login = preload("res://Themes/Fonts/thol_launcher_login_font.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_fsz_spinbox_value_changed(value):
	font_res_default.size = value
	font_res_groupbox.size = value
	font_res_lineedit.size = value
	font_res_login.size = value
	TL_Node.bnr_panel.visible = false
	TL_Node.bnr_panel.visible = true
