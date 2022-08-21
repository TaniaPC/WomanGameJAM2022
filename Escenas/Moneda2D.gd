extends Area2D


signal get_moneda

func _on_Moneda2D_body_entered(body):
	emit_signal("get_moneda")
	queue_free() 
