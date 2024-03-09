extends CharacterBody3D
#Move speed in m/s
@export var speed = 3
@export var fallAcceleration = 70
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("moveForward"):
		direction.x -= 1
	if Input.is_action_pressed("moveBackward"):
		direction.x += 1
	if Input.is_action_pressed("moveLeft"):
		direction.z += 1
	if Input.is_action_pressed("moveRight"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	#target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	velocity = target_velocity
	move_and_slide()
	
	var animations = $Pivot/DamianCooper/AnimationPlayer
	
	if direction != Vector3.ZERO:
		animations.play("Armature|mixamo_com|Layer0")
	if Input.is_action_just_released("moveBackward"):
		animations.stop();
	if Input.is_action_just_released("moveBackward"):
		animations.stop();
	if Input.is_action_just_released("moveForward"):
		animations.stop();
	if Input.is_action_just_released("moveRight"):
		animations.stop();
	if Input.is_action_just_released("moveLeft"):
		animations.stop();
	if !animations.is_playing():
		animations.play("Armature|mixamo_com|Layer0_001")
	
