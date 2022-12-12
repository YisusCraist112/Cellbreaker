extends KinematicBody2D


const ball_scene = preload("res://pelotas/pelota.tscn")

func _physics_process(delta):
	
	var y = position.y
	var mouse_x = get_global_mouse_position().x
	set_position(Vector2(mouse_x,y))


	if Input.is_action_just_pressed("mouse"):
		var ball = ball_scene.instance()
		get_tree().get_root().add_child(ball)
