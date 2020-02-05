extends Control

var total_currency := 0

func _ready():
	pass


func _on_ClickerButton_pressed():
	total_currency += 1
	$TotalCurrencyDisplay.text = 'Total currency: ' + ' ' +str(total_currency)
