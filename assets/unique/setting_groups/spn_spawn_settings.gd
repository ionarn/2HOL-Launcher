tool
extends Control

export(bool) var refresh_min_size = false setget set_refresh_min_size, get_refresh_min_size

var seed_reset_visible = false
var twin_code_reset_visible = false


# Called when the node enters the scene tree for the first time.
func load_values():
	TL_Node.spawn_groupbox.connect("reset_pressed", self, "_on_spn_groupbox_reset_pressed")
	TL_Node.seed_reset.connect("reset_visibility_changed", self, "_on_sed_sn_reset_visibility_changed")
	TL_Node.twin_code_reset.connect("reset_visibility_changed", self, "_on_twc_reset_visibility_changed")
	self.rect_min_size.y = get_child(0).rect_size.y
	seed_reset_visible = TL_Node.seed_reset.get_node("reset").visible
	twin_code_reset_visible = TL_Node.twin_code_reset.get_node("reset").visible
	reset_button_visibility()


func set_refresh_min_size(new_bool):
	refresh_min_size = false
	self.rect_min_size.y = get_child(0).rect_size.y


func get_refresh_min_size():
	return refresh_min_size


func _on_sed_sn_reset_visibility_changed(is_visible):
#	if TL_Node.seed_reset.get_node("reset").visible != is_seed_default:
	var temp = seed_reset_visible
	seed_reset_visible = is_visible
	if temp != seed_reset_visible:
		reset_button_visibility()


func _on_twc_reset_visibility_changed(is_visible):
#	if TL_Node.twin_code_reset.get_node("reset").visible != is_twin_code_default:
	var temp = twin_code_reset_visible
	twin_code_reset_visible = is_visible
	if temp != twin_code_reset_visible:
		reset_button_visibility()


func reset_button_visibility():
	print("Reset Button Visibility Changed")
	var booleans = [
			seed_reset_visible,
			twin_code_reset_visible
	]
	if true in booleans:
		TL_Node.spawn_groupbox.set_reset_visible(true)
	else:
		TL_Node.spawn_groupbox.set_reset_visible(false)


func _on_spn_groupbox_reset_pressed():
	TL_Node.seed_reset.set_pressed()
	TL_Node.twin_code_reset.set_pressed()
