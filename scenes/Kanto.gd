extends StaticBody2D

var player_in_area = false

@export var item: InvItem
var player = null

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("E"):
			cuttingWood()

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true
		
func _on_area_2d_body_exited(body):
	player_in_area = false

func cuttingWood():
	player.axe()
