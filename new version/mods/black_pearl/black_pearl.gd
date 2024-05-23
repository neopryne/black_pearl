extends ContentInfo

const MOD_STRINGS:Array = [
	preload("black_pearl_localization.en.translation"),
]
const MODUTILS: Dictionary = {

}

func _init():
	# Add translation strings
	for translation in MOD_STRINGS:
		TranslationServer.add_translation(translation)

	Console.register("yhwh", {
		"description":"Invoke the mortal name. (this kills you)", 
		"args":[], 
		"target":[WorldSystem, "game_over"]
	})
	SaveSystem.connect("file_loaded", self, "_on_load")

func _on_load():
	var BlackPearl:Resource = load("res://mods/black_pearl/black_pearl.tres")
	#check items for pearl, add it if not there.
	var amount:int = int(min(1, SaveState.inventory.get_space_for(BlackPearl)))
	if (amount > 0):
		#perform silently
		SaveState.inventory.add_new_item(BlackPearl, amount)
		#This one would show a loot screen, don't want that.
		#MenuHelper.give_item(BlackPearl, amount, false)
