extends Control

var total_currency : float = 0.0
signal currency_changed(total_currency)


func _ready():
	pass


func _on_ClickerButton_pressed():
	total_currency += 1.0
	update_currency()


func _on_Timer_timeout():
	total_currency += 1.0
	update_currency()

	
func update_currency():
	emit_signal("currency_changed", total_currency)
