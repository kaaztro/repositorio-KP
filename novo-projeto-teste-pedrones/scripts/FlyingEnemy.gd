
extends RigidBody2D

@export var speed: float = 200.0
@export var target: Node2D

func _physics_process(delta: float) -> void:
    if target:
        # Calcula direção para o player
        var direction: Vector2 = (target.global_position - global_position).normalized()
        
        # Aplica força proporcional ao delta para movimento suave
        apply_force(direction * speed * delta)
        
        # Faz o inimigo rotacionar para olhar para o player
