extends LineEdit

#func load_ini():
#	pass


func save_ini(node: Node, path: String):
	var file = File.new() #new file class on which you will call file class methods
	file.open(path, File.WRITE)  #the file is now opened in the background
	file.store_string(node.text)
	file.open(path, File.READ)
	file.close()


#func reset():
#	pass


#func reset_button_visibility():
#	pass
