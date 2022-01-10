ScriptName DBM_CC_AddItemToAltListScript extends Form

FormList property _AltList auto
Weapon property _Weapon1 auto
Weapon property _Weapon2 auto
Weapon property _Weapon3 auto
Weapon property _Weapon4 auto
Weapon property _Weapon5 auto
Armor property _Armor1 auto
Armor property _Armor2 auto
Armor property _Armor3 auto
Armor property _Armor4 auto
Armor property _Armor5 auto

;;-- Events ---------------------------------------	

Event OnInit()
	_AltList.AddForm(_Weapon1)
	_AltList.AddForm(_Weapon2)
	_AltList.AddForm(_Weapon3)
	_AltList.AddForm(_Weapon4)
	_AltList.AddForm(_Weapon5)
	_AltList.AddForm(_Armor1)
	_AltList.AddForm(_Armor2)
	_AltList.AddForm(_Armor3)
	_AltList.AddForm(_Armor4)
	_AltList.AddForm(_Armor5)
endEvent	
