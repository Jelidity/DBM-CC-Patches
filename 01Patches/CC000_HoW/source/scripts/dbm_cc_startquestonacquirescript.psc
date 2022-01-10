Scriptname DBM_CC_StartQuestOnAcquireScript extends ObjectReference  

ObjectReference Property myRef auto
Quest Property MyQuest auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if (myQuest.getstage() < 1)
			myRef.enable()
			myQuest.setstage(0)
		endif
	endif
EndEvent