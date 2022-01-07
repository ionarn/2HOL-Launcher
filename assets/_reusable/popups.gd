extends Panel


# Called when the node enters the scene tree for the first time.
func set_ok_text():
	$pop_wrong_directory.get_ok().text = "Close 2HOL Launcher"


func _on_pup_wrong_directory_confirmed():
	TL_Func.close_launcher()


func _on_pop_wrong_directory_popup_hide():
	TL_Func.close_launcher()
