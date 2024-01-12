extends RigidBody2D

@export var FruitList: PackedStringArray 

var level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.get_groups().has("SpawnedFruit") && (body.level == level)):
		level += 1
		body.queue_free()
		levelUp()
		print(level)

func levelUp():
	print("I got here")
	scale = Vector2(scale.x*2, scale.y*2)
