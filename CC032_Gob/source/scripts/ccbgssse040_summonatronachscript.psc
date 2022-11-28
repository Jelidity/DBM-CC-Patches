scriptName ccBGSSSE040_SummonAtronachScript extends activemagiceffect

;-- Properties --------------------------------------

spell property ccBGSSSE040_ConjureStormAtronach auto

weapon property ccBGSSSE040_SpearOfBitterMercy auto 

;-- Events ---------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.getitemcount(ccBGSSSE040_SpearOfBitterMercy) >= 1
		ccBGSSSE040_ConjureStormAtronach.Cast(akTarget as objectreference, akTarget as objectreference)
	endif
endEvent
