tool
extends PopupPanel

signal pressed_add
signal item_selected(index)
signal pressed_remove(index, new_selected)
signal becomes_hidden

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

var selected setget select, get_selected
var item_removed setget item_removed_set

export(String) var button_text = "Name" setget text_set, text_get
export(String) var new_item_text = "Text"

var i = 0

# - - - - - - - - - - - - - - - - - - - - - - -

func text_set(s):
	button_text = s
	var label = $pop_vbox/pop_hbox/pop_add_item
	if label:
		label.text = s


func text_get():
	return button_text


func select(new_value : int):
	# Changes the variable [selected] to the new_value (idx) and then changes
	selected = new_value
	emit_signal("item_selected", new_value)
	var entries = $pop_vbox/pop_scrollcontainer/pop_container.get_children()
	for entry in entries:
		entry.get_node("entry_selection").icon = TL_Icon.radio_unchecked
	change_icon(selected, true)
	


func get_selected():
	""" Returns the selected item in the dropdown menu """
	return selected


func get_item_count():
	""" Returns the number of items in the dropdown menu (int) """
	return $pop_vbox/pop_scrollcontainer/pop_container.get_child_count()


func set_item_text(index : int, text : String):
	""" Changes the display text (text) of the item (idx).
	set_item_text(index, text) """
	$pop_vbox/pop_scrollcontainer/pop_container.get_child(index).change_text(text)


func get_item(index : int):
	""" Returns the item specified with index (int) """
	return $pop_vbox/pop_scrollcontainer/pop_container.get_child(index)


func item_removed_set(index : int):
	""" Removes the item (idx) from the dropdown list and
	changes new selected item if necessary """
#	var new_selected = null
	
	if index < selected:
		$pop_vbox/pop_scrollcontainer/pop_container.get_child(index).queue_free()
		emit_signal("pressed_remove", index)
		select(selected - 1)
		change_icon(index + 1, true)
	
	elif index == selected:
		if index == get_last_item_id():
			$pop_vbox/pop_scrollcontainer/pop_container.get_child(index).queue_free()
			emit_signal("pressed_remove", index)
			select(selected - 1)
			
		elif index < get_last_item_id():
			$pop_vbox/pop_scrollcontainer/pop_container.get_child(index).queue_free()
			emit_signal("pressed_remove", index)
			select(selected)
			change_icon(index + 1, true)
	
	elif index > selected:
		$pop_vbox/pop_scrollcontainer/pop_container.get_child(index).queue_free()
		emit_signal("pressed_remove", index)


func change_icon(index : int, boolean : bool):
	if boolean == true:
		get_item(index).find_node("entry_selection").icon = TL_Icon.radio_checked
	else:
		get_item(index).find_node("entry_selection").icon = TL_Icon.radio_unchecked


func _on_Button4_pressed():
	add_entry()


func _on_pop_icon_pressed():
	add_entry()


func add_entry():
	emit_signal("pressed_add")
	
	var inst_entry = TL_Scene.entry.instance()
	inst_entry.get_node("entry_selection").text = new_item_text
	$pop_vbox/pop_scrollcontainer/pop_container.add_child(inst_entry)
	i += 1
	
	select(get_last_item_id())
	change_icon(selected, false)
	change_icon(get_last_item_id(), true)
	self.popup()


func add_item(item_name):
	var inst_entry = TL_Scene.entry.instance()
	inst_entry.get_node("entry_selection").text = item_name
	$pop_vbox/pop_scrollcontainer/pop_container.add_child(inst_entry)


func get_last_item_id():
	return ($pop_vbox/pop_scrollcontainer/pop_container.get_child_count() - 1)


func default_check(index : int, le_list : Array, reset_button : Node):
	if index == 0:
		for line_edit in le_list:
			line_edit.editable = false
			line_edit.mouse_filter = 2
		reset_button.set_visible(false)
	else:
		for line_edit in le_list:
			line_edit.editable = true
			line_edit.mouse_filter = 0
		reset_button.set_visible(true)


func get_items():
	return $pop_vbox/pop_scrollcontainer/pop_container.get_children()


func _on_pop_popup_panel_hide():
	emit_signal("becomes_hidden")


func _on_pop_icon_mouse_entered():
	$pop_vbox/pop_hbox/pop_add_item.set("custom_styles/normal", TL_Style.dropdown_entry_hover)


func _on_pop_icon_mouse_exited():
	$pop_vbox/pop_hbox/pop_add_item.set("custom_styles/normal", TL_Style.dropdown_entry_normal)


func _on_pop_popup_panel_about_to_show():
	pass
#	var entries = $pop_vbox/pop_scrollcontainer/pop_container.get_children()
#	for entry in entries:
#		entry.get_node("entry_selection").pressed = false
