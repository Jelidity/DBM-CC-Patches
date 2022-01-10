Scriptname DBM_CC_CollectUpdateOnActivateScript extends ObjectReference

FormList Property myList auto

ObjectReference Property myDisplay auto

GlobalVariable Property DBM_DisplayCount auto

;----------------------------------------------

Event OnActivate(ObjectReference akActionRef)
	If myDisplay.IsDisabled()
		utility.wait(0.5)
		_CheckList()
	endIf
endEvent

;----------------------------------------------

Function _CheckList()

	Int Index = 0
	Int Count = 0
	
	While Index < MyList.GetSize()
		ObjectReference _CheckDisplay = MyList.GetAt(Index) as ObjectReference
		if !_CheckDisplay.IsDisabled()
			Count += 1
		endif
		Index += 1
	endWhile
	
	If Count == MyList.GetSize()
		myDisplay.Enable()
		DBMDebug.SendDisplayEvent(self, myDisplay, self as form, true)
		DBM_DisplayCount.mod(1)
	endif
endFunction
