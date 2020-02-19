extends Control

export var tier_name : String = ""
export var base_cost : float = 0.0
export var base_currency_increase : float = 0.0
var amount : int = 0
var cost : float = 0.0
var current_currency_increase : float = 0
const MULTIPLIER : float = 1.15
signal current_currency_increase_changed(current_currency_increase)


func _ready():
	calculate_cost(amount, base_cost)
	

func _process(_delta):
	if get_parent().total_currency < cost:
		$BuyButton.disabled = true
	else:
		$BuyButton.disabled = false
	

func _on_BuyButton_pressed():
	amount += 1
	current_currency_increase += base_currency_increase
	get_parent().total_currency -= cost
	calculate_cost(amount, base_cost)
	

func calculate_cost(_amount, _base_cost):
	cost = _base_cost * pow(MULTIPLIER, _amount)
	update_labels()

func update_labels():
	$AmountLabel.text = tier_name + ": " + str(amount)
	$CostLabel.text = "Cost: " + str(stepify(cost, 0.01))
	$CurrencyIncreaseLabel.text = "+" + str(current_currency_increase) + "/s"
	emit_signal("current_currency_increase_changed", current_currency_increase)
