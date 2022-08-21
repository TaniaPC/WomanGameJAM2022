extends Area2D


signal get_moneda

func _on_Moneda2D_body_entered(body):
	queue_free() 
	emit_signal("get_moneda")
