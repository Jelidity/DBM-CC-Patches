Scriptname DBMCampingPatchScript extends Quest

FormList Property CampAllowedWorlds Auto Hidden
FormList Property CampExcludedInteriorWorlds Auto Hidden
FormList Property CampExcludedTownWorlds Auto Hidden
{Formlists used by camping to determine where the player can or cannot camp}

WorldSpace[] Property DBMCampAllowedWorlds Auto
WorldSpace[] Property DBMCampExcludedInteriorWorlds Auto
WorldSpace[] Property DBMCampExcludedTownWorlds Auto
{Arrays containing worldspaces to be added to the corresponding Camping formlists}

Event OnInit()
	
	RegisterForSingleUpdate(20.0)

EndEvent

Event OnUpdate()

	Bool isCampLoaded = Game.GetFormFromFile(0x000801, "ccqdrsse002-firewood.esl")
	
	if isCampLoaded

		CampAllowedWorlds = Game.GetFormFromFile(0x000811, "ccqdrsse002-firewood.esl") As FormList
		CampExcludedInteriorWorlds = Game.GetFormFromFile(0x00081E, "ccqdrsse002-firewood.esl") As FormList
		CampExcludedTownWorlds = Game.GetFormFromFile(0x00081C, "ccqdrsse002-firewood.esl") As FormList

		Int i = DBMCampAllowedWorlds.Length
		Int j = DBMCampExcludedInteriorWorlds.Length
		Int k = DBMCampExcludedTownWorlds.Length
	
		if i > 0
			while i
				CampAllowedWorlds.AddForm(DBMCampAllowedWorlds[i])
				i -= 1
			endwhile
		endif

		if j > 0
			while j
				CampExcludedInteriorWorlds.AddForm(DBMCampExcludedInteriorWorlds[i])
				j -= 1
			endwhile
		endif

		if k > 0
			while k
				CampExcludedTownWorlds.AddForm(DBMCampExcludedTownWorlds[i])
				k -= 1
			endwhile	
		endif
		
	endif
	
EndEvent
