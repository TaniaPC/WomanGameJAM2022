extends Node2D

export var speed = 400.0
var screen_size = Vector2.ZERO
const gravedad = 2
var arriba = Vector2(0, -1)
var direccion = Vector2.ZERO
func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	volar(delta);
	
func volar(delta):
	direccion.y += gravedad
	if (Input.is_action_pressed("ui_up")):
		direccion.y -= (1 + gravedad * 2)
	if (Input.is_action_pressed("ui_left")):
		direccion.x -= 1
	if (Input.is_action_pressed("ui_right")):
		direccion.x += 1
		
	if direccion.length() > 0:
		direccion = direccion.normalized()
	position += direccion * speed * delta
