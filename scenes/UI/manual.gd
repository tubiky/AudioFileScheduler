extends CanvasLayer

@onready var menu_scene = preload("res://scenes/Menu.tscn")
# 사용방법 및 주의사항 안내 Scene
# 주의사항을 다 읽은 뒤 확인 버튼을 누르고 다음으로 진행하도록
# 확인을 누르면 메뉴 화면으로 Scene Change


func _on_confirm_button_pressed():
	get_tree().change_scene_to_packed(menu_scene)
