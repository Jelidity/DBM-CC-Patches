Scriptname DBM_CC_EnableDispOnActScript extends ObjectReference  

ObjectReference Property myRef auto

GlobalVariable Property DBM_DisplayCount Auto

String Property sQuestLine Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer() && myRef.isdisabled())
		myRef.enable()
		DBM_DisplayCount.Mod(1)
		DBMDebug.SendDisplayEvent(Self, Self, Self as Form, true)
		DBMDebug.Log(Self, sQuestLine+ " display enabled.")
	endif
EndEvent
