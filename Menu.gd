extends Control

signal dir_selected

var selected_path
var files

@onready var fileDialog = FileDialog.new() as FileDialog

@export var scene_name = "menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	fileDialog.mode_overrides_title = true
	fileDialog.title = "Choose a directory that has MP3 files"
	fileDialog.access = FileDialog.ACCESS_FILESYSTEM
	fileDialog.file_mode = 2
	add_child(fileDialog)
	fileDialog.dir_selected.connect(_on_file_dialog_dir_selected)
	

'''
# Should return a list object including dictionaries 
# with 4 keys(order, hour, minute, description) based on mp3 files
# Example: [
	{ "order": 1, hour": 08, "minute": 05, "description": "1교시 입실준비"},
	{ "order": 2, hour": 08, "minute": 10, "description": "1교시 입실완료"}
	]
'''

func _on_AddButton_pressed():
	fileDialog.position.x = 12
	fileDialog.position.y = 140
	fileDialog.size.x = 1000
	fileDialog.size.y = 450
	#fileDialog.current_dir = "c:/Users/user/Desktop/"
	fileDialog.popup()


func _on_file_dialog_dir_selected(path):
	Data.schedule.clear()
	Data.files.clear()
	var dir = DirAccess.open(path)
	selected_path = path
	
	if dir:
		Data.files = dir.get_files()
		# Data.files is an array of full file names without absolute path
		print("Data.files: ", Data.files) 
		for file in Data.files:
			var schedule = file.split(" ", true, 2)
			var each_schedule = {
				"order": int(schedule[0]),
				"time": schedule[1],
				"title": schedule[2]
			}
			Data.schedule.append(each_schedule)
		
	else:
		print("Directory not found")
	


# Need to iterate all the file names to make a dictionary for audio schedule
# And set time and file that is required to be played
func _on_start_button_pressed():
	if selected_path != null:
		#var main_scene = load("res://scenes/UI/Main.tscn")
		#get_tree().change_scene_to_packed(main_scene)
		#print(Data.schedule) # Completed!
		for schedule in Data.schedule:
			print(schedule["time"])
			var hour = int(int(schedule["time"])/100)
			print(hour)
			if hour < Data.current_time_hour:
				continue
			
			elif (int(schedule["time"]) - hour * 100) > Data.current_time_minute:
				var file = FileAccess.open(selected_path + "/" + Data.files[0], FileAccess.READ)
				var sound = AudioStreamMP3.new()
				sound.data = file.get_buffer(file.get_length())
				var audioStreamPlayer = AudioStreamPlayer.new()
				audioStreamPlayer.set_stream(sound)
				add_child(audioStreamPlayer)
				audioStreamPlayer.play()
	else:
		print("Directory is not selected!")

func _on_back_button_pressed():
	# print("Back Button has been pressed!")
	# print(selected_path)
	var manual_scene = load("res://scenes/UI/manual.tscn")
	get_tree().change_scene_to_packed(manual_scene)



func _on_quit_button_pressed():
	get_tree().quit()
