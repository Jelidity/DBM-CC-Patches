Scriptname DBM_CC_SetObjOnActivateScript extends ObjectReference  

Quest Property myQuest auto
int Property myObjective01 auto
int Property myObjective02 auto

Event OnActivate (objectReference triggerRef)
	myQuest.SetObjectiveCompleted(myObjective01)
	myQuest.SetObjectiveCompleted(myObjective02)
	myQuest.SetStage(20)
	Utility.Wait(10)
	myQuest.SetStage(30)
EndEvent