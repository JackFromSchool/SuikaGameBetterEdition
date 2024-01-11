extends RigidBody2D

@export var FruitList: PackedStringArray 

var level
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.get_group_name)
	if((body.get_group_name == "SpawnedFruit") && (body.level == level)):
		level += 1
		print(level)
