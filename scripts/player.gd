extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fruitReady = false
var newFruit
var hasStarted = false
@export var FruitScene: PackedScene

func _ready():
	set_visible(false)
	readyFruit()

func _physics_process(delta):
	if not is_visible():
		return
	
	var direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if(fruitReady && newFruit != null):
		newFruit.set_visible(true)
		newFruit.position = position + Vector2(-40, 15)

	if(Input.is_action_pressed("drop")):
		print(position)
		print(newFruit.position)

		newFruit.isHeld = false
		newFruit.position = position + Vector2(-40, 15)

		var new_velocity = Vector2(50, 0)
		newFruit.gravity_scale = 1.0
		newFruit.freeze = false
		newFruit.linear_velocity = new_velocity.rotated(randf_range(4.71 - .2, 4.71 + .2))

		

		newFruit.elasticity = 0.5  

		fruitReady = false
		readyFruit()
			
	move_and_slide()

func readyFruit():
	await get_tree().create_timer(1.0).timeout
	
	newFruit = (FruitScene.instantiate())
	get_parent().add_child(newFruit)
	newFruit.position = position
	
	if(!hasStarted):
		newFruit.set_visible(false)
	
	newFruit.gravity_scale = 0.0;
	newFruit.freeze = true
	fruitReady = true

func start():
	set_visible(true)
	if(newFruit != null):
		newFruit.set_visible(true)
	hasStarted = true
	# Run when the player begins the game

