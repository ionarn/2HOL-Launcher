extends LineEdit

''' VARIABLES '''
var file_path = "./Settings/email.ini" #have the file path
onready var username = get_tree().get_root().find_node('ld_username', true, false)


''' ON PROGRAM START LOAD TEXT '''
func _ready():
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,File.READ)  #the file is now opened in the background
	username.text = file.get_as_text()
	file.close()


''' ON LINE EDIT TEXT CHANGED SAVE TO FILE '''
func _on_LE_Username_text_changed(new_text):
	var file = File.new() #new file class on which you will call file class methods
	file.open(file_path,File.WRITE)  #the file is now opened in the background
	file.store_string(str(new_text))
	file.close()
#	print('the Username has been changed to: ', new_text)
