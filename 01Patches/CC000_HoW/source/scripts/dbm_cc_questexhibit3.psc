Scriptname DBM_CC_Questexhibit3 extends ObjectReference  

Quest Property MyQuest Auto
Int Property MyValue Auto
{Stage to trigger display.}
GlobalVariable Property DBM_DisplayMAX Auto
GlobalVariable Property DBM_useSKSE Auto
String Property sQuestLine = "Unknown Quest" Auto
{Questline this display is relevant to. Defaults to "Unknown Quest"}

Bool Function CheckSKSE()
	if DBM_useSKSE == None
		DBM_useSKSE = Game.GetFormFromFile(0x121697, "LegacyoftheDragonborn.esm") as GlobalVariable
	endif
	
	if DBM_useSKSE.GetValue() == 1
		Return True
	else
		Return False
	endif
EndFunction

Event OnCellAttach()
	DBMDebug.Log(Self, sQuestLine+ " display checking "+MyQuest+" for stage "+MyValue+".")
	 if IsDisabled() && MyQuest.GetStageDone(MyValue)
		Enable()
		GoToState("Completed")
		DBM_DisplayMAX.Mod(1)
		if CheckSKSE()
			;SendModEvent("DBM_ShareDisplay","UpdateQuestDisplay")
			DBMDebug.SendDisplayEvent(Self, Self, NONE, true)
		endif
		DBMDebug.Log(Self, sQuestLine+ " display enabled.")
	endif
endEvent

State Completed
	Event OnCellDetach()
		if IsDisabled() && MyQuest && MyQuest.GetStageDone(MyValue)
			GoToState("")
			DBMDebug.Log(Self, sQuestLine + "quest "+MyQuest+" already passed "+MyValue+" but display is disabled - resetting.")
		endif
	EndEvent
EndState
