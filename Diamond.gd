extends Area2D
signal diamond_collected

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Diamond_body_entered(body: Node) -> void:
	$AnimatedSprite.queue_free()
	$CollisionShape2D.queue_free()
	emit_signal("diamond_collected")
