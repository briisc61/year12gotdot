extends Node3D

const SPEED = 100

@onready var mash = $MeshInstance3D
@onready var ray = $RayCast3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis * Vector3(0, 0, SPEED) * delta