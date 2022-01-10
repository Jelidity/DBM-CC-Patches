scriptname DBM_CC_HallofWondersAPI extends quest

DBM_MuseumAPI property DBM_API auto

formlist property DBM_RoomHallofWonders auto

Event Oninit()
	
	Utility.Wait(10)
	
	DBM_API.AddRoom("Hall of Wonders", DBM_RoomHallofWonders) 
endEvent
		

