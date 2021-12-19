extends LineEdit

''' ON PROGRAM START LOAD TEXT '''
func _ready():
	var file = File.new() #new file class on which you will call file class methods
	file.open(TL_Path.key,File.READ)  #the file is now opened in the background
	TL_Node.ld_key.text = file.get_as_text()
	file.close()


''' ON LINE EDIT TEXT CHANGED SAVE TO FILE '''
func _on_LE_Key_text_changed(new_text): # Saves written text to *.INI file
	var file = File.new() #new file class on which you will call file class methods
	file.open(TL_Path.key,File.WRITE)  #the file is now opened in the background
	file.store_string(str(new_text))
	file.close()
