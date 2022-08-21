extends Node2D

var aux_rotation = 90

func _ready():
	var pass_limit = get_tree().get_root().find_node("Limit", true, false)
	pass_limit.connect("rotate", self, "rotate_world")
	

func rotate_world():
	$Maze.rotation = aux_rotation
	$Player.rotation = -rotation
	aux_rotation = - aux_rotation
	print ($Player.rotation, "-> ", rotation)
