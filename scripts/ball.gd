extends RigidBody2D 

var level = 1
@export var FruitScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.get_groups().has("SpawnedFruit") && (body.level == level)):
		get_parent().dualInputDelay(FruitScene.instantiate(), body, self)
