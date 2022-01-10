Scriptname DBM_CC_SetObjOnAcqScript extends ObjectReference  

Quest Property myQuest auto
int Property myObjective01 auto
int Property myObjective02 auto
int Property myStageToSet auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		myQuest.SetObjectiveCompleted(myObjective01)
		if (myQuest.IsObjectiveCompleted(myObjective02) == true)
			myQuest.SetStage(myStageToSet)
		EndIf
	endif
EndEvent