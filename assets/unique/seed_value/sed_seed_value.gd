extends HBoxContainer

signal spawn_seed_value_changed(new_text)


func _on_sed_sv_lineedit_text_changed(new_text):
	emit_signal("spawn_seed_value_changed", new_text)
