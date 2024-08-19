
	



gtAllPoints =
{
	[1] = { X = 179, Y = 78}, 
	[2] = { X = 170, Y = 81},   
 	[3] = { X = 166, Y = 75}, 
  	[4] = { X = 172, Y = 68}, 
  	[5] = { X = 179, Y = 65}, 
  	[6] = { X = 184, Y = 47}, 
  	[7] = { X = 173, Y = 44}, 
  	[8] = { X = 165, Y = 73}, 
  	[9] = { X = 162, Y = 50}, 
  	[10] = { X = 149, Y = 60},
  	[11] = { X = 156, Y = 70}, 
  	
}


-- für jeden punkt eigenen state erzeugen
for i = 0, 4 do
	
	
	-- die statenamen durchnummerieren
	local sState, sNextState
	sState = "GotoPos" .. i
	if i == 4 then
		sNextState = "GotoPos0"
	else
		sNextState = "GotoPos" .. (i+1)
	end

	State
	{	
		StateName = sState,
		
		
		OnIdleGoHomeFake
		{
			X = (gtAllPoints[gtPersonalCounter[i+1]].X),
			Y = (gtAllPoints[gtPersonalCounter[i+1]].Y),
			Range = 8,
			UpdateInterval = (gtPersonalCounter[i+1] + gtPersonalCounter[5] + individualsumme)*2,
			Conditions = 
			{
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				EntityFlagSetTrue{Name = "ef_PointArrived"},
			},
			OneTimeHomeActions = 
			{
			},
		},
		
		OnEvent
		{
			Conditions = 
			{
				EntityFlagIsTrue{Name = "ef_PointArrived"},
			},
			Actions = 
			{
				EntityFlagSetFalse{Name = "ef_PointArrived"},
			},
			GotoState = sNextState,
		},
		OnFigureRespawnEvent
		{
			WaitTime = 5,
			X = HomePointX-5,
			Y = HomePointY,
			Conditions =
			{
				PlayerBuildingIsInRange {X = HomePointX, Y = HomePointY, Range = 3, Player = "pl_BackUp", BuildingId = 0},
				MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
			},
			Actions =
			{
			},
		},
		
		

		
	
		
		
	}
end



