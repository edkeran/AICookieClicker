extends Node2D

var current_score_label : RichTextLabel

var store_node_preload = preload("res://Game/InGameUI/Store.tscn")
var gallery_node_preload = preload("res://Game/InGameUI/GalleryStore.tscn")
var current_instance_store
var current_instance_gallery

func _ready():
	current_score_label = $MarginContainer/VBoxContainer/ScoreCurrent 
	current_score_label.text = "[p align=center]"+SCORE.format_score_output(SCORE.currentScore)+"[/p]"

func load_new_score():
	current_score_label.text = "[p align=center]"+SCORE.format_score_output(SCORE.currentScore)+"[/p]"

func load_cookies_per_seccond():
	var cookies_per_seccond_label =  $MarginContainer/VBoxContainer/CookiesPerSecond
	cookies_per_seccond_label.text = "Cookies " + SCORE.cookies_per_seccond() + "/s"

func add_store_node():
	remove_gallery_node()
	if(current_instance_store == null):
		current_instance_store = store_node_preload.instantiate()
		self.add_child(current_instance_store)
	else:
		current_instance_store.visible = true

func add_galley_store_node():
	remove_store_node()
	if(current_instance_gallery == null):
		current_instance_gallery = gallery_node_preload.instantiate()
		self.add_child(current_instance_gallery)
	else:
		current_instance_gallery.visible = true
		current_instance_gallery.close_gallery()

func remove_gallery_node():
	if(current_instance_gallery != null):
		current_instance_gallery.visible = false

func remove_store_node():
	if(current_instance_store != null):
		current_instance_store.visible = false

func remove_current_option_node():
	remove_gallery_node()
	remove_store_node()

func add_auto_click(cant_autoclicks):
	load_new_score()
	SCORE.autoClicks += int(cant_autoclicks / SCORE.currentAddingScore)

func change_autoclick_rate(rate_click):
	load_new_score()
	SCORE.currentAddingScore=rate_click

func _on_timer_cookie_generate_timeout():
	SCORE.addAutoClickScore()
	load_cookies_per_seccond()
	load_new_score()

