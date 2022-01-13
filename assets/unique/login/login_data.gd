extends MarginContainer

func load_values():
	var file = File.new()
	if file.file_exists(TL_Path.username) == true:
		load_le_data(TL_Path.username, TL_Node.ld_username)
	else:
		file.open(TL_Path.username, file.WRITE)
		file.store_string("")
	
	if file.file_exists(TL_Path.key) == true:
		load_le_data(TL_Path.key, TL_Node.ld_key)
	else:
		file.open(TL_Path.key, file.WRITE)
		file.store_string("")
	file.close()


func _on_ld_username_text_changed(new_text):
	write_le_data(TL_Path.username, new_text)


func _on_ld_key_text_changed(new_text):
	write_le_data(TL_Path.key, new_text)


func write_le_data(file_path: String, new_text: String):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(file_path, File.WRITE)  #the file is now opened in the background
		file.store_string(str(new_text))
		file.close()

func load_le_data(path: String, node: Node):
	var file = File.new() #new file class on which you will call file class methods
	file.open(path, File.READ)  #the file is now opened in the background
	var username = file.get_as_text()
	if "|" in username:
		node.text = username.left(username.find("|"))
	else:
		node.text = username
	file.close()


func _on_ld_show_key_pressed():
	if TL_Node.ld_key.secret == true:
		TL_Node.ld_key.secret = false
		TL_Node.ld_show_key.icon = TL_Icon.key_hide
		TL_Node.ld_show_key.hint_tooltip = "Hide Key"
	else:
		TL_Node.ld_key.secret = true
		TL_Node.ld_show_key.icon = TL_Icon.key_show
		TL_Node.ld_show_key.hint_tooltip = "Show Key"


func _on_ld_show_menu_pressed():
	var tween = $MarginContainer/VBoxContainer/ld_hbox/ld_show_menu/ld_tween
	var anim_sprite = $MarginContainer/VBoxContainer/ld_hbox/ld_show_menu/ld_anim_sprite
	var show_menu_button = $MarginContainer/VBoxContainer/ld_hbox/ld_show_menu
	if TL_Node.hsplitcontainer.split_offset > 0:
		tween.interpolate_property(TL_Node.hsplitcontainer, "split_offset",
				TL_Node.hsplitcontainer.split_offset, 0, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.nav_navigation_panel, "modulate",
				Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		anim_sprite.animation = "hide"
		show_menu_button.hint_tooltip = "Show Navigation Panel"
		anim_sprite.play()
	else:
		TL_Node.nvp_ScrollContainer.visible = true
		tween.interpolate_property(TL_Node.hsplitcontainer, "split_offset",
				0, TL_Variables.hsplit_max_offset, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.nav_navigation_panel, "modulate",
				Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		TL_Node.nav_advanced_button
		anim_sprite.animation = "show"
		show_menu_button.hint_tooltip = "Hide Navigation Panel"
		anim_sprite.play()


func _on_ld_tween_tween_completed(_object, _key):
	if TL_Node.hsplitcontainer.split_offset < 5:
		TL_Node.nvp_ScrollContainer.visible = false


func _on_ld_show_header_pressed():
	var tween = $MarginContainer/VBoxContainer/ld_hbox/ld_show_header/ld_tween_header
	var anim_sprite = $MarginContainer/VBoxContainer/ld_hbox/ld_show_header/ld_anim_sprite_header
	var show_header_button = $MarginContainer/VBoxContainer/ld_hbox/ld_show_header
	if TL_Node.vsplitcontainer.split_offset > 0:
		tween.interpolate_property(TL_Node.vsplitcontainer, "split_offset",
				TL_Node.vsplitcontainer.split_offset, 0, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.bnr_panel, "modulate",
				Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		anim_sprite.animation = "hide"
		anim_sprite.play()
		show_header_button.hint_tooltip = "Show Banner"
	else:
		TL_Node.bnr_banner.visible = true
		tween.interpolate_property(TL_Node.vsplitcontainer, "split_offset",
				0, TL_Default.vsplit_offset, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(TL_Node.bnr_panel, "modulate",
				Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		anim_sprite.animation = "show"
		anim_sprite.play()
		show_header_button.hint_tooltip = "Hide Banner"


func _on_ld_tween_header_tween_completed(_object, _key):
	if TL_Node.vsplitcontainer.split_offset < 5:
		TL_Node.bnr_banner.visible = false
