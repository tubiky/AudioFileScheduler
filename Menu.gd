extends Control

signal scene_changed
var dirPath
var dir

export (String) var scene_name = "menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.set_window_title("Menu")
	dir = Directory.new()
	print("New Directory has been created.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	if dir.open(dirPath) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found Directory: " + file_name)
			else:
				if file_name.get_extension() == "mp3":
					Data.file.append(file_name)
					Data.schedule.append(file_name.substr(4,4))
				else:
					continue
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
	print(Data.file)
	for e in Data.schedule:
		print(int(e.substr(0,2)),"시 ", int(e.substr(2,2)), "분")
	
	print("Scene change button has been pressed.")
	emit_signal("scene_changed", scene_name)
	
func _on_AddButton_pressed():
	$FileDialog.rect_position.x = 12
	$FileDialog.rect_position.y = 140
	$FileDialog.rect_size.x = 1000
	$FileDialog.rect_size.y = 450
	$FileDialog.mode = FileDialog.MODE_OPEN_DIR
	$FileDialog.current_dir = "c:/Users/user/Desktop/"
	$FileDialog.current_path = "c:/Users/user/Desktop/"
	$FileDialog.access = FileDialog.ACCESS_FILESYSTEM
	$FileDialog.window_title = "Select a Folder"
	$FileDialog.popup()

func _on_FileDialog_dir_selected(dir):
	dirPath = dir
	print(dirPath)
