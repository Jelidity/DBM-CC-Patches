scriptname Display_Enabler extends objectreference 

Quest Property _Display_Quest Auto

Event OnCellAttach()
    
    if _Display_Quest.IsCompleted()
        Self.Enable()
    endIf
        
    if (Self.Is3DLoaded())
        Self.MoveToMyEditorLocation()    
    endIf
endEvent