extends RigidBody2D

class_name Ball

signal ball_off_screen

const MARGIN:float=1
var velocity = Vector2(randf_range(1000.0, 1500.0), 0.0)

func _ready() -> void:
	var _vp_r = Main.get_vpr()
	var x_pos: float = randf_range(_vp_r.position.x + MARGIN, _vp_r.end.x - MARGIN)
	var y_pos: float = randf_range(_vp_r.position.y + MARGIN, _vp_r.end.y - MARGIN)
	var angle: float = randf_range(0, 360)
	position = Vector2(x_pos, y_pos)
	rotation_degrees = angle

func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var bounced = velocity.bounce(collision.get_normal())
		var angle_variation = randf_range(-0.2, 0.2)  # radians
		velocity = bounced.rotated(angle_variation) * randf_range(0.9, 1.1)
	if position.y > Main.get_vpr().end.y:
		ball_off_screen.emit()
		die()

func _on_ball_hit():
	print("on ball hit")
	linear_velocity = linear_velocity.bounce(Vector2.UP)

func die() -> void:
	set_process(false)
	queue_free()
