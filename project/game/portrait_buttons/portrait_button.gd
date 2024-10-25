class_name PortraitButton
extends TextureRect

signal portrait_pressed

var rebecca: CharacterBase


func set_rebecca(new_rebecca: CharacterBase):
	rebecca = new_rebecca


func get_rebecca() -> CharacterBase:
	return rebecca


func set_portrait():
	texture = rebecca.portrait


func _on_frame_button_pressed() -> void:
	emit_signal("portrait_pressed")


func unpress():
	$FrameButton.button_pressed = false
