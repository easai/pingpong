extends Area2D

class_name Pad

const SPEED: float = 500.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement: float = Input.get_axis("left", "right")
	position.x += movement * SPEED * delta
	position.x = clampf(position.x, Main.get_vpr().position.x, Main.get_vpr().end.x)
