extends GPUParticles2D

func _ready():
	emitting = true
	load_label_cookie_rate()

func load_label_cookie_rate():
	$CookieAddedLabel.get_node("cookieAddRateLabel").text = "[p align=center] +"+str(SCORE.currentAddingScore)+"[/p]"

func _on_timer_timeout():
	get_parent().queue_free()

