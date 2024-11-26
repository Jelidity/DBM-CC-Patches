Scriptname DBM_CCRandagulfSetGlobalOnceItm extends ObjectReference  

Int Property DoOnce Auto
GlobalVariable Property RelicGV Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
	if DoOnce == 0
		RelicGV.SetValue(3)
		DoOnce = 1
	endif
	endif
endevent