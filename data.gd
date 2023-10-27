extends Node2D


var schedule = Array()
var files = PackedStringArray()

var current_time_hour
var current_time_minute
var current_time_second

# Need to append all files into 'file' variable
# need to sort out every file in an order of index and extract schedule from it
# need to make schedule automatically based on the second string of each file


func _process(delta):
	current_time_hour = Time.get_time_dict_from_system()["hour"]
	current_time_minute = Time.get_time_dict_from_system()["minute"]
	current_time_second = Time.get_time_dict_from_system()["second"]
	
	# print(current_time_hour, ":", current_time_minute, ":", current_time_second)
