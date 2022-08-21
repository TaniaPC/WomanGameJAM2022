extends Area2D

signal get_cafe

func _on_Cafetera_body_entered(body):
	emit_signal("get_cafe")
	queue_free() 
