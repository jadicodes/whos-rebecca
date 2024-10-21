extends Control

signal rebecca_selected
signal jared_selected


func _on_rebecca_button_pressed() -> void:
	emit_signal("rebecca_selected")


func _on_jared_button_pressed() -> void:
	emit_signal("jared_selected")
