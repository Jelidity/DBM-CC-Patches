Scriptname DBM_CC_EnableOnAcqScript extends ObjectReference  

ObjectReference property myDisplay auto

GlobalVariable Property DBM_DisplayCount auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		myDisplay.enable()
		DBMDebug.SendDisplayEvent(self, myDisplay, self as form, true)
		DBM_DisplayCount.mod(1)
	endif
EndEvent
