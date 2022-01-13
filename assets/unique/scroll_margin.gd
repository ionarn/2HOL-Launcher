extends HSplitContainer

var basic_scrollbar_visible = false
var game_scrollbar_visible = false
var graphics_scrollbar_visible = false
var commands_scrollbar_visible = false
var mods_scrollbar_visible = false
var launcher_scrollbar_visible = false
var navigation_scrollbar_visible = false

func _ready():
	$cnt_content/tab_root/Mods/mod_margin.set("custom_constants/margin_right", 12)
	$cnt_content/tab_root/Launcher/lnc_margin_main.set("custom_constants/margin_right", 12)


func _on_nvp_scroll_container_draw():
	var scroll_container = $nvp_navigation_panel/nvp_margin/nvp_scroll_container
	var margin_container = $nvp_navigation_panel/nvp_margin
	navigation_scrollbar_visible = adjust_scroll_margin(navigation_scrollbar_visible, scroll_container, margin_container)


func _on_scrl_basic_draw():
	var scroll_container = $cnt_content/tab_root/BasicSettings/bsc_margin/bsc_scroll_container
	var margin_container = $cnt_content/tab_root/BasicSettings/bsc_margin
	basic_scrollbar_visible = adjust_scroll_margin(basic_scrollbar_visible, scroll_container, margin_container)


func _on_gam_scroll_container_draw():
	var scroll_container = $cnt_content/tab_root/Game/gam_margin/gam_scroll_container
	var margin_container = $cnt_content/tab_root/Game/gam_margin
	game_scrollbar_visible = adjust_scroll_margin(game_scrollbar_visible, scroll_container, margin_container)


func _on_gfx_scroll_container_draw():
	var scroll_container = $cnt_content/tab_root/Graphics/gfx_margin/gfx_scroll_container
	var margin_container = $cnt_content/tab_root/Graphics/gfx_margin
	graphics_scrollbar_visible = adjust_scroll_margin(graphics_scrollbar_visible, scroll_container, margin_container)


func _on_cmd_scroll_container_draw():
	var scroll_container = $cnt_content/tab_root/Commands/cmd_margin/cmd_scroll_container
	var margin_container = $cnt_content/tab_root/Commands/cmd_margin
	commands_scrollbar_visible = adjust_scroll_margin(commands_scrollbar_visible, scroll_container, margin_container)


func _on_mod_scroll_container_draw():
	var scroll_container = $cnt_content/tab_root/Mods/mod_margin/mod_scroll_container
	var margin_container = $cnt_content/tab_root/Mods/mod_margin
	mods_scrollbar_visible = adjust_scroll_margin(mods_scrollbar_visible, scroll_container, margin_container)


func _on_lnc_scroll_container_draw():
	var scroll_container = $cnt_content/tab_root/Launcher/lnc_margin_main/lnc_scroll_container
	var margin_container = $cnt_content/tab_root/Launcher/lnc_margin_main
	launcher_scrollbar_visible = adjust_scroll_margin(launcher_scrollbar_visible, scroll_container, margin_container)


func adjust_scroll_margin(var_scrollbar_visible, scroll_container, margin_container):
#	var temp_scrollbar_visible = false
	if scroll_container.get_v_scrollbar().visible == true:
		if not var_scrollbar_visible == scroll_container.get_v_scrollbar().visible:
			margin_container.set("custom_constants/margin_right", 0)
		var_scrollbar_visible = true
	else:
		if not var_scrollbar_visible == scroll_container.get_v_scrollbar().visible:
			margin_container.set("custom_constants/margin_right", 12)
		var_scrollbar_visible = false
	return var_scrollbar_visible
