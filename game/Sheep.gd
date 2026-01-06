extends CharacterBody2D

@export var speed := 400
@export var gravity := 0.5
@export var jump_force := 1600

func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y += gravity * speed
	else: 
		velocity.y = 0
		
	#left and right movement
	var input_dir := 0
	if Input.is_action_pressed("left"):
		input_dir -= 1
	if Input.is_action_pressed("right"):
		input_dir += 1
	
	velocity.x = input_dir * speed
	
	#jump mario jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	#I like to move it move it
	move_and_slide()
