extends Node2D

class_name Main

@onready var game_over: AudioStreamPlayer2D = $GameOver
@onready var start_button: Button = $StartButton

const BALL = preload("res://scenes/ball/ball.tscn")

static var _vp_r: Rect2


static func get_vpr():
	return _vp_r


func update_vp() -> void:
	_vp_r = get_viewport_rect()


func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	game_start()


var ball: Ball


func game_start() -> void:
	start_button.hide()
	ball = BALL.instantiate()
	ball.connect("ball_off_screen", self._game_over)
	add_child(ball)


func _process(delta: float) -> void:
	pass


func _game_over() -> void:
	game_over.play()
	start_button.show()


func _on_button_pressed() -> void:
	game_start()


func _on_pad_body_entered(body: Node2D) -> void:
	ball.velocity = ball.velocity.bounce(Vector2.UP)
