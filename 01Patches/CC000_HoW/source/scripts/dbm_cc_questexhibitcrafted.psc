Scriptname DBM_CC_QuestExhibitCrafted extends ObjectReference  

ObjectReference Property myRef auto

GlobalVariable Property DBM_DisplayCount Auto

String Property sQuestLine = "Unknown Quest" Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer() && !akOldContainer
		myRef.enable()
		DBM_DisplayCount.Mod(1)
		DBMDebug.SendDisplayEvent(Self, Self, Self as Form, true)
		DBMDebug.Log(Self, sQuestLine+ " display enabled.")
	endif
EndEvent
