extends Control

signal game_started


func _on_start_button_pressed() -> void:
	emit_signal("game_started")


func _on_explanation_button_pressed() -> void:
	$ExplanationPanel.show()


func _on_ok_button_pressed() -> void:
	$ExplanationPanel.hide()
