tool
extends Panel

export(String) var text = "Name" setget text_set, text_get
signal reset_pressed
signal unfold_pressed

# ---------------------

func text_set(s):
	text = s
	var label = get_node_or_null("MarginContainer/HBox_Video/btn_Video")
	if label:
		label.text = s


func text_get():
	print("Get Text = ", text)
	return text


func _on_btn_Video_pressed():
	emit_signal('unfold_pressed')


func _on_name_reset_button_pressed():
	emit_signal('reset_pressed')
