extends CanvasLayer

onready var current_scene = $Menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene.connect("scene_changed", self, "handle_scene_changed")

func handle_scene_changed(current_scene_name: String):
	var next_level
	var next_level_name: String
	
	match current_scene_name:
		"main":
			next_level_name = "Menu"
			
		"menu":
			next_level_name = "Main" 
		_:
			return
	
	next_level = load("res://scenes/" + next_level_name + ".tscn").instance()
	add_child(next_level)
	next_level.connect("scene_changed", self, "handle_scene_changed")
	current_scene.queue_free()
	current_scene = next_level
