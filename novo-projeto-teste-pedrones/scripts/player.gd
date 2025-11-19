extends CharacterBody2D


const SPEED = 200.0
const JUMP_FORCE = -350.0

var is_jumping := false

@onready var movementAnim := $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta  
		#verifica se o player esta em contato com o chão, e aplica a gravidade

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		#verifica se o botão de pulo foi pressionado e se o player esta no chão, e aplica gravidade negativa (pulo)
		is_jumping = true
	elif is_on_floor():
		is_jumping = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# Movement
	var direction = Input.get_axis("ui_left", "ui_right")

	velocity.x = direction * SPEED

	if direction != 0:
		movementAnim.scale.x = direction

	# ANIMAÇÃO PRIORITÁRIA
	if is_jumping:
		movementAnim.play("jump")
	elif direction != 0:
		movementAnim.play("run")
	else:
		movementAnim.play("idle")

	move_and_slide()
