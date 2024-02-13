extends Area2D

func _on_body_entered(body):
	Global.score += 1
	Global.main_scene_node.spawn_battery()
	queue_free()
