extends MarginContainer

func _on_ld_username_text_changed(new_text):
	write_le_data(TL_Path.username, new_text)


func _on_ld_key_text_changed(new_text):
	write_le_data(TL_Path.key, new_text)


func write_le_data(file_path: String, new_text: String):
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,File.WRITE)  #the file is now opened in the background
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
	
	if TL_Node.HSplitContainer.split_offset > 0:
		tween.interpolate_property(TL_Node.HSplitContainer, "split_offset",
				TL_Node.HSplitContainer.split_offset, 0, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		anim_sprite.animation = "show"
		anim_sprite.play()
		TL_Node.HSplitContainer.split_offset = 0
	else:
		TL_Node.nvp_ScrollContainer.visible = true
		tween.interpolate_property(TL_Node.HSplitContainer, "split_offset",
				0, TL_Variables.hsplit_max_offset, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		anim_sprite.animation = "hide"
		anim_sprite.play()
		TL_Node.HSplitContainer.split_offset = TL_Variables.hsplit_max_offset


func _on_ld_tween_tween_completed(_object, _key):
	if TL_Node.HSplitContainer.split_offset < 5:
		TL_Node.nvp_ScrollContainer.visible = false
