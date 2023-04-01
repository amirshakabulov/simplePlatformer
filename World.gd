extends Node2D

var LifeRemaining
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count = 0
	$goal.text = ""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_KillPlane_body_entered(body: Node) -> void:
	print(body)
	$Player.position.x = 30
	$Player.position.y = 200
	
		
func game_over():
	count =0
	$Player/Camera2D/StaticBody2D.hide()
	
func new_game():
	$StaticBody2D.show()
	$Player.start($StartPosition.position)


func _on_Key_body_entered(body: Node) -> void:
	print("check")
	$goal.text = "Congrats! You Won"


func _on_Diamond_diamond_collected() -> void:
	$Player/Camera2D/Label.text = "Diamonds Collected: " + str(count)
	count +=1
	print(count)
