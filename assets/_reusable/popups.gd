extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$pop_wrong_directory.get_ok().text = "Close 2HOL Launcher"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pup_wrong_directory_confirmed():
	close_program()


func _on_pop_wrong_directory_popup_hide():
	close_program()


func close_program():
	get_tree().quit()



