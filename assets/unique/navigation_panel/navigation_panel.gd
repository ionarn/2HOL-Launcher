extends VBoxContainer

# N A V I G A T I O N   P A N E L

var dynamic_font = DynamicFont.new()

var basic_settings
var basic_settings_text = "BASIC SETTINGS"
var advanced_settings
var advanced_settings_text = "ADVANCED"
var game_settings
var game_settings_text = "GAME"
var graphics_settings
var graphics_settings_text = "GRAPHICS"
var command_settings
var command_settings_text = "COMMANDS"
var mod_settings
var mod_settings_settings = "MODS"
var launcher_settings
var launcher_settings_text = "LAUNCHER"
var information
var information_text = "INFORMATION"
var change_log
var change_log_text = "CHANGE LOG"

#func _ready():
#	TL_Node.nav_advanced_container = $nvp_ScrollContainer/VBoxContainer/nvp_advanced_split/nvp_advanced_container


# Called when the node enters the scene tree for the first time.
func load_menu_selection():
	TL_Node.nav_advanced_container = $nvp_ScrollContainer/VBoxContainer/nvp_advanced_split/nvp_advanced_container
	if TL_Node.tabs_root.current_tab == 0:
		TL_Node.nav_basic_settings.pressed = true

# Called when the button "Basic Settings"
# in the Navigation Panel has been pressed.
func _on_nvp_basic_settings_pressed():
	# Changes the current tab to 0 (Basic Settings Page).
	TL_Node.tabs_root.current_tab = 0


# Called when the button "Adanced"
# in the Navigation Panel has been pressed.
func _on_nvp_advanced_pressed():
#	TL_Node.nav_advanced_container = $nvp_ScrollContainer/VBoxContainer/Control2/nvp_advanced_container
	# Shows/Hides the Advanced Settings container.
#	TL_Node.nav_advanced_container.visible = !TL_Node.nav_advanced_container.visible
	var tween = $nvp_ScrollContainer/VBoxContainer/nvp_tween
	var advanced_arrow = $nvp_ScrollContainer/VBoxContainer/nvp_advanced/nvp_advanced_arrow
	var advanced_split = $nvp_ScrollContainer/VBoxContainer/nvp_advanced_split
	TL_Node.nav_info_container
	if advanced_split.rect_min_size == Vector2(0, 0):
		TL_Node.nav_advanced_container.visible = true
		tween.interpolate_property(advanced_split, "rect_min_size",
				advanced_split.rect_min_size, Vector2(0, TL_Node.nav_advanced_container.rect_size.y), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.nav_advanced_container, "modulate",
				Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(advanced_arrow, "rotation_degrees",
				0, 90, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		TL_Node.nav_advanced_container.visible = true
	
	elif advanced_split.rect_min_size == Vector2(0, TL_Node.nav_advanced_container.rect_size.y):
		TL_Node.nav_advanced_container.mouse_filter = 2
		tween.interpolate_property(advanced_split, "rect_min_size",
				advanced_split.rect_min_size, Vector2(0, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.nav_advanced_container, "modulate",
				Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(advanced_arrow, "rotation_degrees",
				90, 0, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()


func _on_nvp_tween_tween_completed(object, key):
	var advanced_split = $nvp_ScrollContainer/VBoxContainer/nvp_advanced_split
	if advanced_split.rect_min_size == Vector2(0, 0):
		TL_Node.nav_advanced_container.visible = false
#		vsplit_advanced.rect_min_size.y = 42
	if advanced_split.rect_min_size.y == TL_Node.nav_advanced_container.rect_size.y:
		TL_Node.nav_advanced_container.mouse_filter = 0


# Called when the button "Game"
# in the Navigation Panel has been pressed.
func _on_nvp_game_pressed():
	# Changes the current tab to 1 (Game Settings Page).
	TL_Node.tabs_root.current_tab = 1


# Called when the button "Graphics"
# in the Navigation Panel has been pressed.
func _on_nvp_graphics_pressed():
	# Changes the current tab to 2 (Graphic Settings Page).
	TL_Node.tabs_root.current_tab = 2


# Called when the button "Emotions"
# in the Navigation Panel has been pressed.
func _on_nvp_emotions_pressed():
	# Changes the current tab to 3 (Emotion Settings Page).
	TL_Node.tabs_root.current_tab = 3


# Called when the button "Mods"
# in the Navigation Panel has been pressed.
func _on_nvp_mods_pressed():
	# Changes the current tab to 4 (Mod Settings Page).
	TL_Node.tabs_root.current_tab = 4


# Called when the button "Change Log"
# in the Navigation Panel has been pressed.
func _on_nvp_change_log_pressed():
	# Changes the current tab to 5 (Change Log Page).
	TL_Node.tabs_root.current_tab = 6


# Called when the Node "Advanced Container" changes visibility.
func _on_nvp_advanced_container_visibility_changed():
	# Checks if "Advanced Container" is visible.
	# If visible, the "Advanced Button" uses the icon "menu open".
	# If not visible, the "Advanced Button" uses the icon "menu closed".
#	if TL_Node.nav_advanced_container.visible == true:
#		TL_Node.nav_advanced_button.icon = TL_Icon.menu_opened
#	else:
#		TL_Node.nav_advanced_button.icon = TL_Icon.menu_closed
	pass


# Called when the button "Commands"
# in the Navigation Panel has been pressed.
func _on_nvp_commands_pressed():
	# Changes the current tab to 5 (Commands Page).
	TL_Node.tabs_root.current_tab = 6


# Called when the button "Information"
# in the Navigation Panel has been pressed.
func _on_nvp_info_pressed():
	# Shows/Hides the Information container.
	pass


func _on_nvp_launcher_pressed():
	TL_Node.tabs_root.current_tab = 5


# Called when the Node "Info Container" changes visibility.
func _on_nvp_info_container_visibility_changed():
	# Checks if "Info Container" is visible.
	# If visible, the "Info Button" uses the icon "menu open".
	# If not visible, the "Info Button" uses the icon "menu closed".
	if TL_Node.nav_info_container.visible == true:
		TL_Node.nav_info_button.icon = TL_Icon.menu_opened
	else:
		TL_Node.nav_info_button.icon = TL_Icon.menu_closed

# Called when the user drags the HSplitContainer.
func _on_HSplitContainer_dragged(offset):
	# Checks if the offset of the HSplitContainer goes below 1.
	# If lower, it hides the left column. If higher, it shows it again.
	if offset <= 1:
		TL_Node.nvp_ScrollContainer.visible = false
	else:
		TL_Node.nvp_ScrollContainer.visible = true
	
	# Checks if the HSplitContainer exceeds the max_offset value.
	# If so, it stops it from going further
	if offset > TL_Variables.hsplit_max_offset:
		TL_Node.HSplitContainer.split_offset = TL_Variables.hsplit_max_offset
