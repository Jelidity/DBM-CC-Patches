Scriptname DBM_CC_SetGlobOnAcqScript extends ObjectReference  

GlobalVariable Property myGlobal auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		if (myGlobal.GetValue() == 0)
			myGlobal.SetValue(100)
		EndIf
	endif
EndEvent