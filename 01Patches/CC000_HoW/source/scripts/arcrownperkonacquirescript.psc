Scriptname ARCrownPerkOnAcquireScript extends ObjectReference  

Perk Property CCLichCrownPerk auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if !(Game.GetPlayer().HasPerk(CCLichCrownPerk))
			Game.GetPlayer().AddPerk(CCLichCrownPerk)
;			Debug.notification("Ayleid Crown of Rielle perk added!")
;		else
;			Debug.notification("You already have the perk.")
		endif
	endif
EndEvent