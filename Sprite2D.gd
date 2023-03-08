extends Sprite2D

var speed = 400
var angular_speed = PI
@export var timer: Timer

func _ready():
# 	var timer = get_node("Timer")
	timer.timeout.connect(_on_Timer_timeout)
	
func _on_Timer_timeout():
	visible = not visible

func _process(delta):

	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	rotation += angular_speed * horizontal * delta 
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	
		position += velocity * delta

func _on_button_pressed():
	set_process(not is_processing())
