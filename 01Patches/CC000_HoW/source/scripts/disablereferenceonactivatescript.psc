Scriptname DisableReferenceOnActivateScript extends ObjectReference

ObjectReference Property myRef1 auto
ObjectReference Property myRef2 auto
ObjectReference Property myRef3 auto
ImageSpaceModifier Property myImod auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		myImod.ApplyCrossFade(0.5)
		utility.wait(0.5)
		myRef1.Disable()
		myRef2.Disable()
		myRef3.Enable()
		ImageSpaceModifier.RemoveCrossFade()
	endif
EndEvent