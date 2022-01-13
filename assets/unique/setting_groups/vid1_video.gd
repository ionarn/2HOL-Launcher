tool
extends Control

export(bool) var refresh_min_size = false setget set_refresh_min_size, get_refresh_min_size

var fullscreen_reset_visible = false
var resolution_reset_visible = false
var borderless_reset_visible = false
var mousepointer_reset_visible = false
var vsync_reset_visible = false


# Called when the node enters the scene tree for the first time.
func load_values():
	self.rect_min_size.y = get_child(0).rect_size.y
	TL_Node.vid1_groupbox.connect("reset_pressed", self, "_on_vid1_groupbox_reset_pressed")
	TL_Node.fullscreen_reset.connect("reset_visibility_changed", self, "_on_fullscreen_reset_visibility_changed")
	TL_Node.resolution_reset.connect("reset_visibility_changed", self, "_on_resolution_reset_visibility_changed")
	TL_Node.borderless_reset.connect("reset_visibility_changed", self, "_on_borderless_reset_visibility_changed")
	TL_Node.mousepointer_reset.connect("reset_visibility_changed", self, "_on_mousepointer_reset_visibility_changed")
	TL_Node.vsync_reset.connect("reset_visibility_changed", self, "_on_vsync_reset_visibility_changed")
	fullscreen_reset_visible = TL_Node.fullscreen_reset.get_node("reset").visible
	resolution_reset_visible = TL_Node.resolution_reset.get_node("reset").visible
	borderless_reset_visible = TL_Node.borderless_reset.get_node("reset").visible
	mousepointer_reset_visible = TL_Node.mousepointer_reset.get_node("reset").visible
	vsync_reset_visible = TL_Node.vsync_reset.get_node("reset").visible
	reset_button_visibility()


func set_refresh_min_size(new_bool):
	refresh_min_size = false
	self.rect_min_size.y = get_child(0).rect_size.y


func get_refresh_min_size():
	return refresh_min_size


func _on_fullscreen_reset_visibility_changed(is_visible):
	var temp = fullscreen_reset_visible
	fullscreen_reset_visible = is_visible
	if temp != fullscreen_reset_visible:
		reset_button_visibility()


func _on_resolution_reset_visibility_changed(is_visible):
	var temp = resolution_reset_visible
	resolution_reset_visible = is_visible
	if temp != resolution_reset_visible:
		reset_button_visibility()


func _on_borderless_reset_visibility_changed(is_visible):
	var temp = borderless_reset_visible
	borderless_reset_visible = is_visible
	if temp != borderless_reset_visible:
		reset_button_visibility()


func _on_mousepointer_reset_visibility_changed(is_visible):
	var temp = mousepointer_reset_visible
	mousepointer_reset_visible = is_visible
	if temp != mousepointer_reset_visible:
		reset_button_visibility()


func _on_vsync_reset_visibility_changed(is_visible):
	var temp = vsync_reset_visible
	vsync_reset_visible = is_visible
	if temp != vsync_reset_visible:
		reset_button_visibility()


func reset_button_visibility():
	print("Reset Button Visibility Changed")
	var booleans = [
			fullscreen_reset_visible,
			resolution_reset_visible,
			borderless_reset_visible,
			mousepointer_reset_visible,
			vsync_reset_visible
	]	
	if true in booleans:
		TL_Node.vid1_groupbox.set_reset_visible(true)
	else:
		TL_Node.vid1_groupbox.set_reset_visible(false)


func _on_vid1_groupbox_reset_pressed():
	TL_Node.fullscreen_reset.set_pressed()
	TL_Node.resolution_reset.set_pressed()
	TL_Node.borderless_reset.set_pressed()
	TL_Node.mousepointer_reset.set_pressed()
	TL_Node.vsync_reset.set_pressed()
