extends Node2D

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Game/MainGame.tscn")

func _on_exit_pressed():
	get_tree().quit()
