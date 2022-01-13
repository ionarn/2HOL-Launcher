extends Control

# ---------------------

signal button_pressed
signal reset_visibility_changed(is_visible)

# ---------------------

func set_visible(boolean: bool):
	$reset.visible = boolean


func _on_reset_pressed():
	emit_signal("button_pressed")


func _on_reset_mouse_entered():
	TL_Node.tween.interpolate_property(self, "modulate",
			self.modulate, Color(1, 1, 1, 1), 0.35,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	TL_Node.tween.start()


func _on_reset_mouse_exited():
	TL_Node.tween.interpolate_property(self, "modulate",
			self.modulate, Color(1, 1, 1, 0.75), 0.35,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	TL_Node.tween.start()


func set_pressed():
	emit_signal("button_pressed")


func _on_reset_draw():
	emit_signal("reset_visibility_changed", $reset.visible)


func _on_reset_hide():
	emit_signal("reset_visibility_changed", $reset.visible)
