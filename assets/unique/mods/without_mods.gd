extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_wio_download_hetuw_pressed():
	OS.shell_open("https://github.com/risvh/OneLife-1/releases")


func _on_wio_download_day_night_pressed():
	OS.shell_open("https://github.com/Defalt36/TwoLife/releases")
