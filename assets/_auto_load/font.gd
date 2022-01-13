extends Node

#var ROBOTO_LIGHT
#var ROBOTO_REGULAR
#var ROBOTO_BOLD

var default
var groupbox
var lineedit
var login


func load_variables():
#	ROBOTO_LIGHT = preload("res://assets/fonts/Roboto-Light.ttf")
#	ROBOTO_REGULAR = preload("res://assets/fonts/Roboto-Regular.ttf")
#	ROBOTO_BOLD = preload("res://assets/fonts/Roboto-Bold.ttf")

	default = preload("res://assets/fonts/thol_launcher_default_font.tres")
	groupbox = preload("res://assets/fonts/thol_launcher_groupbox_font.tres")
	lineedit = preload("res://assets/fonts/thol_launcher_lineedit_font.tres")
	login = preload("res://assets/fonts/thol_launcher_login_font.tres")
