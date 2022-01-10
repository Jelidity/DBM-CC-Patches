ScriptName DBM_CC_AddRefToFormListSKSEScript extends Quest

FormList property myMainList1 auto
FormList property myMainList2 auto
FormList property myMainList3 auto
FormList property myMainList4 auto
FormList property myMainList5 auto

FormList property myAddList1 auto
FormList property myAddList2 auto
FormList property myAddList3 auto
FormList property myAddList4 auto
FormList property myAddList5 auto

;;-- Events ---------------------------------------	

Event OnInit()
	RegisterForSingleUpdate(10.0)
endEvent

Event OnUpdate()
	if myAddList1 && myMainList1
		myMainList1.AddForms(myAddList1.ToArray())
	endif
	if myAddList2 && myMainList2
		myMainList2.AddForms(myAddList2.ToArray())
	endif
	if myAddList3 && myMainList3
		myMainList3.AddForms(myAddList3.ToArray())
	endif
	if myAddList4 && myMainList4
		myMainList4.AddForms(myAddList4.ToArray())
	endif
	if myAddList5 && myMainList5
		myMainList5.AddForms(myAddList5.ToArray())
	endif
endEvent
