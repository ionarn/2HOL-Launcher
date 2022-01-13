extends LineEdit

func load_ini(node: Node, path: String, default_setting):
	var file = File.new()
	if file.file_exists(path):
		file.open(path, file.READ)
		node.text = file.get_as_text()
	else:
		file.open(path,file.WRITE)
		file.store_string(str(default_setting))
	file.close()


func save_ini(node: Node, path: String):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(path, File.WRITE)  #the file is now opened in the background
		file.store_string(node.text)
		file.close()


func reset(node: Node, default_setting):
	node.text = str(default_setting)


func reset_button_visibility(node: Node, reset_button: Node, default_setting):
	if str(node.text) == str(default_setting):
		reset_button.set_visible(false)
	else:
		reset_button.set_visible(true)
