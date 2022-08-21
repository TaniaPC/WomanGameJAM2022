extends Area2D

signal rotate

func _on_Area2D_body_entered(body):
	#queue_free() libera espacio de memoria lo elimina
	emit_signal("rotate")
	print("rotate")
