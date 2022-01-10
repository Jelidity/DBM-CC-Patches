scriptName DBM_CC_ExplorationDisplayScript extends ObjectReference

ObjectReference property myDisplay auto

GlobalVariable Property DBM_DisplayCount auto

bool Counted

Event OnTriggerEnter(ObjectReference akTriggerRef)
	if akTriggerRef == Game.GetPlayer() && myDisplay.IsDisabled()
		myDisplay.enable()
		DBMDebug.SendDisplayEvent(self, myDisplay, self as form, true)
		DBM_DisplayCount.mod(1)
		self.disable()
	endIf
endEvent
