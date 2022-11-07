Scriptname dbm_cc_setmultistageonacquireitem extends ObjectReference  
{Sets a quest stage when this item is put in the player's inventory.}

Quest Property myQST01 auto
{Quest upon which to set stage. Default is the Alias's owning quest.}
int Property preReqStage01 = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int Property StageToSet01 auto
{Set this stage when the player picks up this item.}

Quest Property myQST02 auto
{Quest upon which to set stage. Default is the Alias's owning quest.}
int Property preReqStage02 = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int Property StageToSet02 auto
{Set this stage when the player picks up this item.}
	
auto State waiting	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (Game.GetPlayer() == akNewContainer)
			if ( (preReqStage01 == -1) || (myQST01.GetStageDone(preReqStage01) == True) )
				myQST01.SetStage(StageToSet01)
				GoToState("inactive")
			endif
			if ( (preReqStage02 == -1) || (myQST02.GetStageDone(preReqStage02) == True) )
				myQST02.SetStage(StageToSet02)
				GoToState("inactive")
			endif
		endif
	EndEvent
EndState

State inactive
EndState
