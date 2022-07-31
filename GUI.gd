extends CanvasLayer

func _on_PauseMenu_visibility_changed():
	$PauseButton.visible = !$PauseButton.visible
