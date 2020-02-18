extends Control

export var base_cost : float = 0.0
var amount : int = 0
var cost : float = 0.0
signal amount_changed(amount)
signal cost_changed(cost)


func _ready():
	calculate_cost(amount, base_cost)
	

func _on_BuyButton_pressed():
	amount += 1
	calculate_cost(amount, base_cost)
	

func calculate_cost(amount, base_cost):
	cost = amount * base_cost
	update_amount_display()

func update_amount_display():
	emit_signal("amount_changed", amount)
	emit_signal("cost_changed", cost)
