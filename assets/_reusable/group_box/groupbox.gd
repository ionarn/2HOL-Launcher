tool
extends Panel

export(String) var text = "Name" setget set_text, get_text
export(String) var hiding_container_node = ""
export(bool) var use_reset_button = true setget set_use_reset_button, get_use_reset_button

signal reset_pressed

# ---------------------

func set_text(new_text):
	var label = $MarginContainer/HBox_Video/btn_Video
	text = new_text.to_upper()
	if label:
		label.text = new_text.to_upper()


func get_text():
	print("Get Text = ", text)
	return text


func set_use_reset_button(new_boolean):
	var reset = $MarginContainer/HBox_Video/name_reset
	use_reset_button = new_boolean
	if reset:
		reset.visible = new_boolean


func get_use_reset_button():
	return use_reset_button


func _on_btn_Video_pressed():
	var container = TL_Func.exec("TL_Node." + hiding_container_node)
	TL_AccordionMenu.collapse(container, self)


func _on_name_reset_button_pressed():
	emit_signal('reset_pressed')
