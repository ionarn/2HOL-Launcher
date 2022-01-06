extends HBoxContainer

signal item_selected(index, parent_root_name)

# - - - - - - - - - - - - - - - - - - - - - - -

func _on_entry_selection_pressed():
	for child in self.get_parent().get_children():
		child.get_node('entry_selection').icon = TL_Icon.radio_unchecked
	$entry_selection.icon = TL_Icon.radio_checked
	var index = self.get_index()
	var parent_root_name = get_parent().owner.name
	get_parent().owner.select(index)
	get_parent().owner.visible = false


func change_text(text):
	$entry_selection.text = text


func change_icon():
	if $entry_selection.pressed == true:
		$Control/entry_removal.texture_normal = TL_Icon.remove_normal_s
		$Control/entry_removal.texture_hover = TL_Icon.remove_hover_s
		$Control/entry_removal.texture_pressed = TL_Icon.remove_hover_s
	else:
		$Control/entry_removal.texture_normal = TL_Icon.remove_normal_us
		$Control/entry_removal.texture_hover = TL_Icon.remove_hover_us
		$Control/entry_removal.texture_pressed = TL_Icon.remove_hover_us


func _on_TextureButton_pressed():
	self.get_parent().owner.item_removed_set(self.get_index())


func _on_entry_selection_mouse_entered():
	$Control/entry_removal.texture_normal = TL_Icon.remove_hover_us


func _on_entry_selection_mouse_exited():
	$Control/entry_removal.texture_normal = TL_Icon.remove_transparent
