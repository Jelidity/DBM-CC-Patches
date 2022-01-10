Scriptname DBM_CC_StartQuestOnReadScript extends ObjectReference  

ObjectReference Property myRef auto
Quest Property MyQuest auto
Int Property myStageToSet auto

Event OnRead()
	if (myQuest.getstage() < 1)
		myRef.enable()
		myQuest.setstage(myStageToSet)
	endif
EndEvent