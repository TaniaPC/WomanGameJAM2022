extends Area2D


signal fin_mes

func _on_Area2D_body_entered(body):
	emit_signal("fin_mes")
	queue_free() 
