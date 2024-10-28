extends Control

@onready var main_menu = $MainMenu
@onready var game = $Game
@onready var character_select = $CharacterSelect
@onready var end_screen = $EndScreen


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
	character_select.start()


func _on_character_select_rebecca_selected() -> void:
	_change_current_scene(game)
	game.start()


func _on_end_screen_yes_button_pressed() -> void:
	_change_current_scene(game)
	game.start()


func _on_end_screen_no_button_pressed() -> void:
	_change_current_scene(main_menu)


func _on_game_game_over() -> void:
	var _score = game.get_score()
	end_screen.set_score(_score)
	_change_current_scene(end_screen)
	end_screen.start()
