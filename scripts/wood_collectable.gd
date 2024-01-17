extends StaticBody2D


func _ready():
	pickedup()

func pickedup():
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("picked")
	print("+1 wood")
	await get_tree().create_timer(0.3).timeout
