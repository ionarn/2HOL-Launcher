extends Button


func _on_Button_pressed():
	var output = []
	var file_path = "./TEST.txt"
	var file = File.new()
	if file.file_exists(file_path):
#		var dir = Directory.new()
#		dir.remove(file_path)
#		OS.execute("CD " + file_path, [file_path], true, output)
		var cut_path = file_path.erase(0, 2)
		OS.execute("del", [file_path], true, output)
	else:
		file.open(file_path, File.WRITE)
		file.store_string("TEST")
		file.close()
