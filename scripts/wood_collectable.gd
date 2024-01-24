extends StaticBody2D

@export var item: InvItem
var player = null

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player = body
		playercollect()
		print("+1 Puu")
		self.queue_free()
		
func playercollect():
	player.collect(item)
