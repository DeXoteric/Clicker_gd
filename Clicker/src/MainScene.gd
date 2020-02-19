extends Control

var total_currency : float = 0.0
var currency_increase_per_second : float = 0.0
var tier1_currency_per_second : float = 0.0
var tier2_currency_per_second : float = 0.0
var tier3_currency_per_second : float = 0.0

func _ready():
	pass


func _on_ClickerButton_pressed():
	total_currency += 1.0
	update_currency()
	

func _on_Timer_timeout():
	total_currency += currency_increase_per_second / 10
	update_currency()


func update_currency():
	currency_increase_per_second = tier1_currency_per_second + tier2_currency_per_second + tier3_currency_per_second
	$TotalCurrencyDisplay.text = "Total currency: " + " " + str(stepify(total_currency, 0.01))
	$CurrencyPerSecDisplay.text = "+" + str(currency_increase_per_second) + " /s"


func _on_Tier1_current_currency_increase_changed(current_currency_increase):
	tier1_currency_per_second = current_currency_increase
	update_currency()


func _on_Tier2_current_currency_increase_changed(current_currency_increase):
	tier2_currency_per_second = current_currency_increase
	update_currency()


func _on_Tier3_current_currency_increase_changed(current_currency_increase):
	tier3_currency_per_second = current_currency_increase
	update_currency()
