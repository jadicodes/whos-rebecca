extends Control

@onready var main_menu = $MainMenu
@onready var game = $Game
@onready var character_select = $CharacterSelect


func _ready():
	_change_current_scene(main_menu)


func _change_current_scene(scene: Node):
	# If current scene does not equal scene, hide them. Show the current scene.
	for scenes in get_children():
		if scenes != scene:
			scenes.hide()
		else:
			scenes.show()


func _on_main_menu_game_started() -> void:
	_change_current_scene(character_select)


func _on_character_select_rebecca_selected() -> void:
	_change_current_scene(game)
	game._choose_random_characters("Rebecca")


func _on_character_select_jared_selected() -> void:
	_change_current_scene(game)
	game._choose_random_characters("Jared")
