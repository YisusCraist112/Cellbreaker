extends RigidBody2D

const SpeedUp = 100
const MaxSpeed = 3000

var contador_bloques = 0

func _ready():
	contador_bloques = get_tree().get_nodes_in_group("ladrillos").size()
	
func _physics_process(delta):
	
	if contador_bloques == 0:
		get_tree().change_scene("res://niveles/Nivel_2.tscn")
		queue_free()
		
	if position.y > get_viewport_rect().end.y:
		get_tree().reload_current_scene()
		
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("ladrillos"):
			contador_bloques -= 1
			body.queue_free()
		
		if body.get_name() == "Tabla":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("limite").get_blobal_position()
			var velocity = direction.normalized()*min(speed+SpeedUp, MaxSpeed)
			set_linear_velocity(velocity)
