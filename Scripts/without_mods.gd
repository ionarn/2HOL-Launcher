extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_wio_download_hetuw_pressed():
	OS.shell_open("https://github.com/risvh/OneLife-1/releases")


func _on_wio_download_day_night_pressed():
	OS.shell_open("https://github.com/Defalt36/TwoLife/releases")
