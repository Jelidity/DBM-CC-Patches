Scriptname EnableReferenceOnAcquireScript extends ObjectReference  

ObjectReference Property myRef auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		myRef.enable()
	endif
EndEvent