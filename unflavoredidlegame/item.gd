class_name Item extends Node

@export var cost: int = 0
@export var payout: int = 0
@export var timeToPayout: float = 0.0
@export var amountHeld: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = timeToPayout
	if amountHeld > 0:
		$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _send_payment() -> void:
	get_parent().currency += (payout * amountHeld)
	
func buy(amount: int) -> void:
	if amount == 0:
		$Timer.start()
	amountHeld += amount

func _on_timer_timeout() -> void:
	_send_payment()
