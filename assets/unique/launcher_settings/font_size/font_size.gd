extends HBoxContainer

#var font_res_default = preload("res://Themes/Fonts/thol_launcher_default_font.tres")
#var font_res_groupbox = preload("res://Themes/Fonts/thol_launcher_groupbox_font.tres")
#var font_res_lineedit = preload("res://Themes/Fonts/thol_launcher_lineedit_font.tres")
#var font_res_login = preload("res://Themes/Fonts/thol_launcher_login_font.tres")

var config = ConfigFile.new()
var load_response = config.load(TL_Path.launcher_settings)

# Called when the node enters the scene tree for the first time.
func _ready():
	config.set_value("defaults", "font_size", 14)
	if config.has_section_key("launcher", "font_size") != true:
		config.set_value("launcher", "font_size", 14)
	else:
		var font_size = config.get_value("launcher", "font_size")
		TL_Font.default.size = font_size
		TL_Font.groupbox.size = font_size
		TL_Font.lineedit.size = font_size
		TL_Font.login.size = font_size
		TL_Node.bnr_panel.visible = false
		TL_Node.bnr_panel.visible = true
		reset_button_visibility(font_size, TL_Default.font_size)


func _on_fsz_spinbox_value_changed(value):
	TL_Font.default.size = value
	TL_Font.groupbox.size = value
	TL_Font.lineedit.size = value
	TL_Font.login.size = value
	TL_Node.bnr_panel.visible = false
	TL_Node.bnr_panel.visible = true
	config.set_value("launcher", "font_size", value)
	config.save(TL_Path.launcher_settings)
	reset_button_visibility(value, TL_Default.font_size)


func reset_button_visibility(font_size, default_value):
	if int(font_size) == int(default_value):
		TL_Node.font_size_reset.get_node("reset").visible = false
	else:
		TL_Node.font_size_reset.get_node("reset").visible = true
