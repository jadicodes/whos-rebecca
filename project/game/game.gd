extends Control

signal correct
signal wrong

var correct_rebecca: CharacterBase
var selected_rebecca: CharacterBase

@export var _rebeccas: Array[CharacterBase]
@onready var _portrait_grid = %PortraitGridContainer


func _ready():
	%PortraitButton.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton))
	%PortraitButton2.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton2))
	%PortraitButton3.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton3))
	%PortraitButton4.portrait_pressed.connect(_on_portrait_button_pressed.bind(%PortraitButton4))

# Choose 4 random Rebecca's from the array of all Rebecca's

func _choose_random_characters(character: String):
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
	print("s: " + str(selected_rebecca))
	print("c: " + str(correct_rebecca))
	if selected_rebecca == correct_rebecca:
		print("win")
		emit_signal("correct")
	else:
		print("lose")
		emit_signal("wrong")


func _on_portrait_button_pressed(portrait_button: PortraitButton):
	print("SIGNAL RECIEVED!!!!!!!!")
	selected_rebecca = portrait_button.get_rebecca()
	print(portrait_button.get_rebecca())
	print(selected_rebecca)
	for child in _portrait_grid.get_children():
		if child.get_rebecca() != selected_rebecca:
			child.unpress()

# When a button is pressed, all other buttons become unpressed.

# When any button is pressed, the lock in button becomes enabled.
# If no buttons are pressed, the lock in button becomes disabled.

# If the lock in button is pressed, determine if the player picked the right Rebecca.
