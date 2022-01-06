extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = "./changelog.txt" #have the file path
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path, File.READ)  #the file is now opened in the background
	self.bbcode_text = file.get_as_text()
	file.close()


func _on_RichTextLabel_draw():
	pass
