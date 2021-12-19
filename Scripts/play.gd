extends Button

#var file_path = 'C:/WINDOWS/system32/notepad.exe'
var file_path = '.\\launch_2hol.bat'
#var file_path = 'res://launch_2hol.bat'
var bat_content = "@ECHO OFF\nCD %~dp0\\2HOL_win_v20279\\\nSTART OneLife.exe\nEXIT"
#var array = [""]
#var args = PoolStringArray()
#var file_path = 'START res://launch_2hol.bat'
#var file_path = '.\\2HOL_win_v20279\\OneLife.exe'
#var file_path = 'C:/Data/Games/2HOL_win_v20279/2HOL_win_v20279/OneLife.exe'
#onready var output = []

#var thread

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var file_check = File.new()
	if file_check.file_exists(file_path) == false:
		var file = File.new()
		file.open(file_path, File.WRITE)
		file.store_line(bat_content)
		file.close()


func open_program():
	var thread = Thread.new() # create thread
	print('Create Thread ID: ', thread)
	print('Thread Active: ', thread.is_active())
	
	thread.start(self, 'run_it', null, 0)
	print('\nStart the thread: ')
	print('Thread Active: ', thread.is_active())
	
	thread.wait_to_finish()
#	thread.free()
#	var wait_for_thread = thread.wait_to_finish()

func run_it(_param):
	var array = ["c:/temp/text.txt"]
	var args = PoolStringArray(array)
#	OS.execute(file_path, [], false)
#	OS.execute('@ECHO OFF', args, true)
#	OS.execute('CD %~dp0\\2HOL_win_v20279\\', args, true)
#	OS.execute('START OneLife.exe', args, true)
#	OS.execute('EXIT', args, true)
#	OS.shell_open(file_path)
	OS.execute("./OneLife.exe", PoolStringArray([]))
#	OS.execute("CMD.exe", [file_path], true, output)
#	OS.execute("echo somethingyo", [], true, output)
#	for o in output:
#		print(o)
#	OS.execute("echo", ["/s", "c:test.png"], false)
	return 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Btn_Play_pressed():
	open_program()
	var file = File.new() #new file class on which you will call file class methods
#	var does_file_exist = file.file_exists("./Launch_2HOL.bat")
#	print('File Exists: ', str(file.file_exists("./Launch_2HOL.bat")))
	print('File Exists: ', str(file.file_exists(file_path)))
	file.close()
