extends StaticBody2D

var sound_effect: AudioStreamPlayer = null
var tween : Tween
var particleCookieClick = load("res://Game/particule_cookie_added.tscn")
var isPhoneOS : bool = false

func _ready():
	isPhoneOS = OS.get_name() == 'Android'
	sound_effect = AudioStreamPlayer.new()
	sound_effect.stream = load("res://sound/cookieClick.mp3")
	add_child(sound_effect)

func _on_input_event(viewport, event, shape_idx):
	if isPhoneOS and event is InputEventScreenTouch and event.pressed:
		handle_click_cookie(event)
	if not isPhoneOS and event.is_action_pressed("ButtonClick"):
		handle_click_cookie(event)

func handle_click_cookie(event):
	var cookie = get_node("ShapeCookie/Cookie")
	SCORE.addScore()
	sound_cookie()
	tween = get_tree().create_tween()
	tween.tween_property($ShapeCookie/Cookie, "scale", Vector2(0.6,0.6), 0.1)
	$ShapeCookie/Cookie/Particle1.emmit_particle()
	add_cookie_particle(event.position)
	tween.tween_property($ShapeCookie/Cookie, "scale", Vector2(0.445,0.502), 0.1)
	get_node("ShapeCookie").get_parent().get_parent().load_new_score()

func add_cookie_particle(position):
	var nodo_particle = particleCookieClick.instantiate() 
	nodo_particle.global_position = position
	get_tree().get_root().add_child(nodo_particle)

func kill_tween():
	if(tween):
		tween.kill()

func sound_cookie():
	sound_effect.play()

func _on_ui_ingame_unable_cookie():
	self.get_parent().add_store_node()
	self.get_parent().current_instance_store.connect("add_auto_click", Callable(self.get_parent(), "add_auto_click"))
	self.get_parent().current_instance_store.connect("change_auto_click_rate", Callable(self.get_parent(), "change_autoclick_rate"))
	$ShapeCookie.disabled = true

func _on_ui_ingame_able_cookie():
	self.get_parent().remove_current_option_node()
	$ShapeCookie.disabled = false
