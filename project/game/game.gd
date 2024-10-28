extends Control

signal correct
signal wrong
signal game_over

var correct_rebecca: CharacterBase
var selected_rebecca: CharacterBase
var points: int

@export var _rebeccas: Array[CharacterBase]
@onready var _portrait_grid = %PortraitGridContainer


func _ready():
	%PortraitButton.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton))
	%PortraitButton2.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton2))
	%PortraitButton3.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton3))
	%PortraitButton4.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton4))


func _process(delta: float) -> void:
	$TimeBar.value = $Timer.time_left
	$PointsLabel.text = "Points: " + str(points)


# Start for the game, resets EVERYTHING

func start() -> void:
	_reset_game()
	$TimeBar.value = 30
	$Timer.start()
	points = 0

# Reset the portraits and create new selectable Rebecca

func _reset_game() -> void:
	_choose_random_characters()
	for child in _portrait_grid.get_children():
		child.unpress()


func get_score() -> int:
	return points


# Choose 4 random Rebecca's from the array of all Rebecca's

func _choose_random_characters() -> void:
	var picked_characters: Array[CharacterBase]
	var pool_of_characters = _rebeccas

	pool_of_characters.shuffle()
	
	for n in range(_portrait_grid.get_children().size()):
		picked_characters.append(_rebeccas[n])
	
	_create_portraits(picked_characters)

	correct_rebecca = picked_characters.pick_random()
	_set_traits(correct_rebecca)


# Iterate through children of PortraitGridContainer and set texture property to portrait

func _create_portraits(array_of_characters):
	var counter = 0
	for child in _portrait_grid.get_children():
		child.texture = array_of_characters[counter].get_portrait()
		child.set_rebecca(array_of_characters[counter])
		counter += 1
	counter = 0


# Set the three traits of the selected Rebecca in the textbox

func _set_traits(rebecca):
	rebecca.traits.shuffle()
	$Textbox.set_traits(rebecca.traits[0], rebecca.traits[1], rebecca.traits[2])


# When lock in button is pressed, emit signal to alert main

func _on_lock_in_button_pressed() -> void:
	if selected_rebecca == correct_rebecca:
		emit_signal("correct")
	else:
		emit_signal("wrong")


func _on_portrait_button_pressed(portrait_button: PortraitButton):
	selected_rebecca = portrait_button.get_rebecca()
	for child in _portrait_grid.get_children():
		if child.get_rebecca() != selected_rebecca:
			child.unpress()


func _on_correct() -> void:
	points += 1
	_reset_game()


func _on_wrong() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	emit_signal("game_over")
