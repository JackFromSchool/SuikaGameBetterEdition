extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hasFruit = false
@export var FruitScene: PackedScene

func _ready():
	set_visible(false)

func _physics_process(delta):
	
	if not is_visible():
		return
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if(Input.get_axis("ui_up", "ui_down")):
		spawnFruit()
	
	move_and_slide()
	

func spawnFruit():
	var newFruit = (FruitScene.instantiate())
	add_child(newFruit)
	newFruit.position = Vector2(0, 0)
	
	var new_velocity = Vector2(50, 0)
	
	newFruit.linear_velocity = new_velocity.rotated(randf_range(4.71 - .2, 4.71 + .2))
	
	newFruit.level = 1

func start():
	set_visible(true)
	# Run when the player begins the game
