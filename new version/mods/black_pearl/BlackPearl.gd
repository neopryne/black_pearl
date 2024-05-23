extends BaseItem

#clear all children of menu helper.
#close current menu
func _use_in_world(_node, _context, _arg):
	remove_node(MenuHelper.get_node("InventoryMenu"), MenuHelper)
	remove_node(MenuHelper.get_node("MapPauseMenu"), MenuHelper)
	WorldSystem.game_over()

func remove_node(node, parent):
	node.cancel()

func _use_in_battle(_node, fighter, arg):
	#Play damage effect to player form.  Play damage effect to player.  Lose battle.
	var beast = load("res://data/elemental_types/beast.tres")
	var damage = Damage.new()
	damage.source = fighter
	damage.damage = 9999
	damage.types = [ beast ]
	fighter.get_controller().take_damage(damage)
	Debug.lose_battle()
