extends TileMap


func _ready():
	$Player.rotation = -rotation
	print ($Player.rotation, rotation)


