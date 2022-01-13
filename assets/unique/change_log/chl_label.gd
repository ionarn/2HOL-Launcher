extends Label

# Called when the node enters the scene tree for the first time.
func load_value():
	var file_path = "./changelog.txt" #have the file path
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path, File.READ)  #the file is now opened in the background
	self.text = file.get_as_text()
	file.close()

	TL_Node.change_log.rect_min_size = Vector2(0, rect_size.y)
	print(str(rect_size.y))
