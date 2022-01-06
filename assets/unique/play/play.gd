extends Button

var bat_path = "./launch_2hol.bat"
var sh_path = "./launch_2hol.sh"
#var bat_content = "@ECHO OFF\nCD %~dp0\\2HOL_win_v20279\\\nSTART OneLife.exe\nEXIT"
var sh_content = "#!/usr/bin/env sh\n./OneLifeApp"


func open_program():
	var thread = Thread.new() # create thread
	print('Create Thread ID: ', thread)
	print('Thread Active: ', thread.is_active())
	thread.start(self, 'run_it', null, 0)
	print('\nStart the thread: ')
	print('Thread Active: ', thread.is_active())
#	thread.wait_to_finish()
	
	var thread2 = Thread.new()
	thread2.start(self, "delete_it", null, 0)
	thread2.wait_to_finish()
	
#	thread.free()

func run_it(_param):
	var array = ["c:/temp/text.txt"]
	var stuff = PoolStringArray(array)
	if OS.get_name() == "Windows":
		var file = File.new()
		var bat_content = "@ECHO OFF\nCD " + bat_path + "\nSTART OneLife.exe\nEXIT"
		file.open(bat_path, File.WRITE)
		file.store_line(bat_content)
		file.close()
		var bat_path_changed = bat_path
		bat_path_changed.erase(0, 2)
		bat_path_changed = ".\\" + bat_path_changed
		OS.shell_open(bat_path_changed)
	elif OS.get_name() == "X11":
		var output = []
		var file = File.new()
		file.open(sh_path, File.WRITE)
		file.store_line(sh_content)
		file.close()
		OS.execute("chmod", ["+x", sh_path], true, output)
		OS.execute(sh_path, PoolStringArray([]))


func delete_it(_param):
	var output = []
	OS.delay_msec(250)
	if OS.get_name() == "Windows":
		var cut_path = bat_path
		cut_path.erase(0, 2)
		OS.execute("del", [cut_path], true, output)
	elif OS.get_name() == "X11":
		OS.execute("rm", [sh_path], true, output)


func _on_Btn_Play_pressed():
	open_program()
