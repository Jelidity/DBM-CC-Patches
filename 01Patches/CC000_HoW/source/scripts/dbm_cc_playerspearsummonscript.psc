Scriptname DBM_CC_PlayerSpearSummonScript extends weapon  

GlobalVariable Property myAbility auto

Actor Property PlayerRef auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef && !PlayerRef.HasSpell(myAbility)
		PlayerRef.AddSpell(myAbility, false)
	endif
EndEvent