Scriptname AddPerkOnEquipScript extends ObjectReference  

Perk Property TargetPerk auto

Event OnEquipped(Actor akActor)
	akActor.AddPerk(TargetPerk)
EndEvent

Event OnUnEquipped(Actor akActor)
	akActor.RemovePerk(TargetPerk)
EndEvent