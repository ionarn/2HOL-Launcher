extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var file_path = "D:/Data/Projects/Godot Projects/Readme.txt" #have the file path
	var file_path = "../Readme.txt" #have the file path
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,file.READ)  #the file is now opened in the background
	self.text = file.get_as_text()
	print(file.get_as_text())
	file.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RichTextLabel_draw():
	pass
	#var file_path = "../Readme.txt" #have the file path
	#var file_path = "res://HBox_TitleBar.gd" #have the file path
	#var file = File.new() #new file class on which you will call file class methods
	#file.open(file_path,file.READ)  #the file is now opened in the background
	#print(file.get_as_text())
	#RichTextLabel.text() == file.get_as_text()
	#file.close()
