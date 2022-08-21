extends KinematicBody2D

export var speed = 600.0
const gravedad = 2
var direction = Vector2.ZERO

func _ready():
	pass
func _physics_process(delta):
	move(delta);
	
func move(delta):
	var is_floor = is_on_floor();
	direction.y += gravedad
	if (Input.is_action_pressed("ui_up")):
		direction.y -= (1+ gravedad *2)
	if (Input.is_action_pressed("ui_left")):
		direction.x -= 1
		$Animation.flip_h = true
	if (Input.is_action_pressed("ui_right")):
		direction.x += 1
		$Animation.flip_h = false
	if (Input.is_action_pressed("ui_down")):
		direction.y += 1
	if direction.length() > 0:
		direction = direction.normalized()
	
	var velocity = move_and_slide(direction * speed, Vector2.UP, true)
	play_animation(is_floor, velocity)
	

func is_on_floor():
	var is_floor = false
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.normal.dot(Vector2.UP) > 0.8):
			is_floor = true
	return is_floor

func play_animation(is_floor, velocity):
	if is_floor:
		$Animation.animation = "Walk"
		$Animation.offset.y = 50;
		if  velocity == Vector2(0,0) :
			$Animation.animation = "Idle"
	else:
		$Animation.animation = "Jump"

	if($Animation.animation != "Walk"):
		$Animation.offset.y = 0;
	$Animation.play()
