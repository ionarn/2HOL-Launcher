extends Control

# ---------------------

signal button_pressed

# ---------------------

func _on_Reset_pressed():
	emit_signal('button_pressed')


func visible(boolean):
	$reset.visible = boolean
