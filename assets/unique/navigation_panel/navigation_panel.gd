extends VBoxContainer

# N A V I G A T I O N   P A N E L

var dynamic_font = DynamicFont.new()


# Called when the node enters the scene tree for the first time.
func _ready():
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
	# Shows/Hides the Advanced Settings container.
	TL_Node.nav_advanced_container.visible = !TL_Node.nav_advanced_container.visible


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
	TL_Node.tabs_root.current_tab = 5


# Called when the Node "Advanced Container" changes visibility.
func _on_nvp_advanced_container_visibility_changed():
	# Checks if "Advanced Container" is visible.
	# If visible, the "Advanced Button" uses the icon "menu open".
	# If not visible, the "Advanced Button" uses the icon "menu closed".
	if TL_Node.nav_advanced_container.visible == true:
		TL_Node.nav_advanced_button.icon = TL_Icon.menu_opened
	else:
		TL_Node.nav_advanced_button.icon = TL_Icon.menu_closed


# Called when the button "Commands"
# in the Navigation Panel has been pressed.
func _on_nvp_commands_pressed():
	# Changes the current tab to 5 (Commands Page).
	TL_Node.tabs_root.current_tab = 6


# Called when the button "Information"
# in the Navigation Panel has been pressed.
func _on_nvp_info_pressed():
	# Shows/Hides the Information container.
	TL_Node.nav_info_container.visible = !TL_Node.nav_info_container.visible


func _on_nvp_launcher_pressed():
	TL_Node.tabs_root.current_tab = 6


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
