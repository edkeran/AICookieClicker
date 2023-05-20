extends Node2D

var current_score_label : RichTextLabel

var store_node_preload = preload("res://Game/InGameUI/Store.tscn")
var gallery_node_preload
var current_instance_store

func _ready():
	current_score_label = $MarginContainer/VBoxContainer/ScoreCurrent 
	current_score_label.text = "[p align=center]"+str(SCORE.currentScore)+"[/p]"

func load_new_score():
	current_score_label.text = "[p align=center]"+str(SCORE.currentScore)+"[/p]"

func load_cookies_per_seccond():
	var cookies_per_seccond_label =  $MarginContainer/VBoxContainer/CookiesPerSecond
	cookies_per_seccond_label.text = "Cookies " + SCORE.cookies_per_seccond() + "/s"
	pass

func add_store_node():
	if(current_instance_store == null):
		current_instance_store = store_node_preload.instantiate()
		self.add_child(current_instance_store)

func remove_current_option_node():
	if(current_instance_store != null):
		current_instance_store.queue_free()

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
