extends Control

# ---------------------

signal button_pressed

# ---------------------

func set_visible(boolean: bool):
	$reset.visible = boolean


func _on_reset_pressed():
	emit_signal('button_pressed')
