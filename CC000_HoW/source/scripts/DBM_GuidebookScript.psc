Scriptname DBM_GuidebookScript extends ObjectReference  
{Controller script for Guidebook in Legacy V5}

Quest Property DBM_Guidebookhandler Auto
{Quest controlling the global vairable show in the guidebook}
ReferenceAlias Property Guidebook Auto
{DBM_Guidebookhandler primary alias}
ReferenceAlias Property GuidebookBackup Auto
{DBM_Guidebookhandler reserve alias}
ReferenceAlias Property AuryenAlias Auto
{DBM_Guidebookhandler find Auryen alias.}
LocationAlias Property AuryenLocation Auto
{DBM_Guidebookhandler alias used for Auryen's location.}
GlobalVariable Property DBM_DisplayCount Auto

;;MESSAGES
Message Property DBM_GuideMSG Auto
{Main Menu - Find Auryen, Travel, Read}
Message Property DBM_GuideMSG1 Auto
{Travel to HOH, Upper Gallery, Library, SafeHouse}
Message Property DBM_GuideMSG2 Auto
{Travel to Daedric Galley, HOLE, Natural Science, Hall of Oddities}
Message Property DBM_GuideMSG3 Auto
{Travel to Armoury main, south, west, east, lower}
;Message Property DBM_GuideMSG4 Auto
;{Travel to Art Gallery, Dragonborn Hall, Hall of Wonders }
Message Property DBM_GuideBlockedMSG Auto
{Something is amiss}
Message Property DBM_GuideFirstUseMSG Auto
{Intro message}
Message Property DBM_GuideOutOfBoundsMSG Auto
{Not in the museum.}
Message Property DBM_GuideNewLocationMSG Auto
{A new teleport option was unlocked.}
Message Property DBM_GuideAuryenLocationMSG Auto
{Where is Auryen?}
Message Property DBM_GuideAuryenUnknownMSG Auto
{Auryen is currently disabled.}
Message Property DBM_GuideSameCellErrorMSG Auto
{Trying to teleport into the cell you're already in.}

Keyword Property DBM_GuideBookTravel Auto
{Keyword to replace location reference}

Actor Property AuryenMorellus Auto
{The main man.}

;;BLocking conditions
Globalvariable Property SafehouseAccess Auto
{Global that blocks safehouse access.}
Quest Property DBM_MuseumHeist Auto
Quest Property DBM_hauntedMuseumQuest Auto
Quest Property DBM_ExplorerGuildHouse Auto
Quest Property DBM_PlanetariumQuest Auto

ObjectReference[] Property aTeleportLocations1 Auto
{Teleport locations from the first menu}
ObjectReference[] Property aTeleportLocations2 Auto
{Teleport locations from the second menu}
ObjectReference[] Property aTeleportLocations3 Auto
{Teleport locations from the third menu}

Bool DisplayPlannerState = False
Bool FirstUse = TRUE
Bool GuildHouseTravel
Bool PlanetariumTravel
Bool SafeHouseTravel

DBM_DisplayPlanningScript Property DisplayManager Auto

ReferenceAlias Property MyAlias Auto
{Leave blank for replacement guides.}

ReferenceAlias Function RegisterAlias(bool bAdd = True)
	if bAdd ;Add to an alias
		if !Self
			debug.TraceUser("LegacyoftheDragonborn", Self+" Cannot add to alias as this object no longer has a valid reference.")
			Return NONE
		endif
		
		if (Guidebook.GetReference() != Self) && (GuidebookBackup.GetReference() != Self)
			if !Guidebook.ForceRefIfEmpty(Self)
				GuidebookBackup.ForceRefTo(Self)
				MyAlias = GuidebookBackup
				debug.TraceUser("LegacyoftheDragonborn", Self+" Guide book picked up and forced into alias.")
				Return GuidebookBackup
			else
				MyAlias = Guidebook
				Return Guidebook
			endif
		endif
	else ;Remove
		if MyAlias
			debug.TraceUser("LegacyoftheDragonborn", Self+" Guidebook removed, clearing alias: "+MyAlias)
			MyAlias.Clear()
			Return NONE
		elseif Self && Guidebook.GetReference() == Self
			Guidebook.Clear()
			Return NONE
		elseif Self && GuidebookBackup.GetReference() == Self
			GuidebookBackup.Clear()
			Return NONE
		endif
	endif
EndFunction


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if MyAlias
		Return
	endif
	
	if akNewContainer == Game.GetPlayer()
		MyAlias = RegisterAlias()
	elseif akOldContainer == Game.GetPlayer()
		MyAlias = RegisterAlias(false)
	endif
EndEvent

Event OnRead()	
	DBM_Guidebookhandler.UpdateCurrentInstanceGlobal(DBM_DisplayCount)
	AuryenLocation.ForceLocationTo(AuryenMorellus.GetCurrentLocation())
	Actor PlayerRef = Game.GetPlayer()
	
	if !MyAlias
		MyAlias = RegisterAlias()
	endif
	
	if !PlayerRef.GetItemCount(Self.GetBaseObject())
		Return
	endif
	
	if !(PlayerRef.GetCurrentLocation() && PlayerRef.GetCurrentLocation().HasKeyword(DBM_GuideBookTravel))
		DBM_GuideOutOfBoundsMSG.Show()
		Return
	else

	;IF MUSEUM IS BLOCKED OFF BY A QUEST
	Utility.WaitMenuMode(1)
	Int HauntStg = DBM_HauntedMuseumQuest.GetStage()
	Int HeistStg = DBM_MuseumHeist.GetStage()
	if (HauntStg >= 5 && HauntStg < 110) || (HeistStg >= 5 && HeistStg < 60)
		DBM_GuideBlockedMSG.Show()
		Return
	endif
	;Intro message
	if FirstUse
		DBM_GuideFirstUseMSG.Show()
		FirstUse = False
	endif
	;;Safehouse unlocked
	if !SafeHouseTravel && SafehouseAccess.GetValue() == 1
		SafeHouseTravel = True
		DBM_GuideNewLocationMSG.Show()
	endif		
	;;Guidehouse unlocked
	if !GuildHouseTravel && DBM_ExplorerGuildHouse.IsCompleted()
		GuildHouseTravel = True
		DBM_GuideNewLocationMSG.Show()
	endif
	;;Planetarium unlocked
	if !PlanetariumTravel && (DBM_PlanetariumQuest.GetStage() > 20 || DBM_PlanetariumQuest.IsCompleted())
		PlanetariumTravel = True
		DBM_GuideNewLocationMSG.Show()
	endif
	;Utility.WaitMenuMode(2)
	;;Open the actual menu
	int iNavOption = DBM_GuideMSG.Show()
	if iNavOption == 0 ;Find Auryen
		if AuryenMorellus.IsEnabled()
			DBM_GuideAuryenLocationMSG.Show()
			;Force Auryen into the alias and enable the quest marker.
			AuryenAlias.ForceRefTo(AuryenMorellus)
			DBM_Guidebookhandler.SetObjectiveDisplayed(0, true, true)
			AuryenAlias.RegisterForSingleUpdate(30)
		else
			DBM_GuideAuryenUnknownMSG.Show()
		endif
	elseif iNavOption == 1 ;Teleport
		ObjectReference TeleportDestination
		int iTeleportOption = DBM_GuideMSG1.Show()
		if iTeleportOption < 4 ;Hall of Heroes, East Halls, Library, Safehouse
			TeleportDestination = aTeleportLocations1[iTeleportOption]
			if PlayerRef.GetParentCell() != TeleportDestination.GetParentCell()
				debug.TraceUser("LegacyoftheDragonborn", Self+" teleporting player to: "+TeleportDestination)
				PlayerRef.MoveTo(TeleportDestination)
			else
				DBM_GuideSameCellErrorMSG.Show()
			endif
		elseif iTeleportOption == 4 ;Next Menu
			iTeleportOption = DBM_GuideMSG2.Show()
			if iTeleportOption < 4 ;Nat Science, Armory, West Armory, East Armory
				TeleportDestination = aTeleportLocations2[iTeleportOption]
				if PlayerRef.GetParentCell() != TeleportDestination.GetParentCell()
					debug.TraceUser("LegacyoftheDragonborn", Self+" teleporting player to: "+TeleportDestination)
					PlayerRef.MoveTo(TeleportDestination)
				else
					DBM_GuideSameCellErrorMSG.Show()
				endif
			elseif iTeleportOption == 4 ;Next menu
				iTeleportOption = DBM_GuideMSG3.Show()
				if iTeleportOption < 4 ;DBHall, Guildhouse, Planetarium, HOW
					TeleportDestination = aTeleportLocations3[iTeleportOption]
					if PlayerRef.GetParentCell() != TeleportDestination.GetParentCell()
						debug.TraceUser("LegacyoftheDragonborn", Self+" teleporting player to: "+TeleportDestination)
						PlayerRef.MoveTo(TeleportDestination)
					else
						DBM_GuideSameCellErrorMSG.Show()
					endif
				elseif iTeleportOption == 4 ;Cancel
					;
				endif
			endif
		endif
	elseif iNavOption == 3 ;Display Planner
		if DisplayPlannerState == False
			DisplayPlannerState = True
			DisplayManager.EnableIcons()
		elseif DisplayPlannerState == True
			DisplayPlannerState = False
			DisplayManager.DisableIcons()
		endif
	endif
	
endif
	
EndEvent
