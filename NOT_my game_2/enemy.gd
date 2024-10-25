extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var player = get_node("/root/World/Character")

var movement_speed = 70

func _ready():
	call_deferred("get_target")

	
func get_target():
	nav_agent.target_position = player.global_transform.origin
	
	
func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		get_target()
	
	var current_position = global_position
	var next_position = nav_agent.get_next_path_position()
	var new_velocity = next_position - current_position
	new_velocity = new_velocity.normalized()  *movement_speed
	
	velocity = new_velocity
	move_and_slide()
	%zombiewithanimations/AnimationPlayer.play("Armature_003|mixamo_com|Layer0")
	$ZombieModel.look_at(player.global_position)
	
