extends MarginContainer

func _on_ld_username_text_changed(new_text):
	write_le_data(TL_Path.username, new_text)


func _on_ld_key_text_changed(new_text):
	write_le_data(TL_Path.key, new_text)


func write_le_data(file_path: String, new_text: String):
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,File.WRITE)  #the file is now opened in the background
	file.store_string(str(new_text))
	file.close()

func load_le_data(path: String, node: Node):
	var file = File.new() #new file class on which you will call file class methods
	file.open(path, File.READ)  #the file is now opened in the background
	var username = file.get_as_text()
	if "|" in username:
		node.text = username.left(username.find("|"))
	else:
		node.text = username
	file.close()
