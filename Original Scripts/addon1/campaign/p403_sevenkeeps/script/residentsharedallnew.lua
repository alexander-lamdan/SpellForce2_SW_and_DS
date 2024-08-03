
HomepointX = 440.905
HomepointY = 322.418	

gtMyBed =
{  
  [1] = { X = 369.151, Y = 156.501 },
  [2] = { X = 371.039, Y = 383.906 },
  [3] = { X = 507.831, Y = 317.912 },
  [4] = { X = 434.429, Y = 159.541 },
  [5] = { X = 234.968, Y = 204.674 },
  [6] = { X = 218.145, Y = 319.715 },
  [7] = { X = 207.74, Y = 343.714 },
  [8] = { X = 334.645, Y = 476.592 },
  [9] = { X = 251.178, Y = 267.311 }, 
  [10] = { X = 124.49, Y = 250.888 },
}	

gtAllPoints =
{
	[1] = { X = 379.327, Y = 380.892 }, 
	[2] = { X = 344.702, Y = 369.888 },   
 	[3] = { X = 231.55, Y = 339.543 }, 
  	[4] = { X = 244.46, Y = 274.077 }, 
  	[5] = { X = 258.68, Y = 211.665 }, 
  	[6] = { X = 410.146, Y = 145.737 }, 
  	[7] = { X = 423.201, Y = 132.455 }, 
  	[8] = { X = 432.52, Y = 120.552 }, 
  	[9] = { X = 491.15, Y = 299.187}, 
  	[10] = { X = 481.923, Y = 283.389 },
  	[11] = { X = 369.35, Y = 282.715}, 
  	[12] = { X = 407.125, Y = 392.707 }, 
  	[13] = { X = 441.951, Y = 459.945},
  	[14] = { X = 449.334, Y = 501.292 },
  	[15] = { X = 335.426, Y = 581.877 },
  	[16] = { X = 397.003, Y = 623.478 },  
  	[17] = { X = 388.341, Y = 605.493 }, 
  	[18] = { X = 490.081, Y = 616.714 }, 
  	[19] = { X = 508.513, Y = 458.149 },
  	[20] = { X = 518.033, Y = 407.301 },
  	[21] = { X = 542.689, Y = 340.455 }, 
  	[22] = { X = 524.45, Y = 340.867 },   
 	[23] = { X = 542.652, Y = 312.716 }, 
  	[24] = { X = 597.125, Y = 328.144 }, 
  	[25] = { X = 596.309, Y = 355.654 }, 
  	[26] = { X = 584.993, Y = 369.045 }, 
 	[27] = { X = 574.053, Y = 392.269 }, 
  	[28] = { X = 538.448, Y = 407.994 }, 
  	[29] = { X = 587.424, Y = 311.826 }, 
  	[30] = { X = 445.773, Y = 245.596 },
  	
}


-- für jeden punkt eigenen state erzeugen
for i = 0, 9 do
	
	
	-- die statenamen durchnummerieren
	local sState, sNextState
	sState = "GotoPos" .. i
	if i == 9 then
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
			UpdateInterval = (gtPersonalCounter[i+1] + gtPersonalCounter[10] + individualsumme)*2,
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
	
		
		OnEvent
		{
			Conditions =
			{
				TimeIsNotBetween{StartHour = 6, EndHour = 20},
			},
			Actions =
			{
			},
			GotoState = "Night"
		},
	}
end



State
{	
		StateName = "Night",

		OnIdleGoHomeFake
		{
			X = (gtMyBed[individualsumme].X),
			Y = (gtMyBed[individualsumme].Y),
			Range = 15,
			UpdateInterval = 20 + individualsumme,
			Conditions = 
			{
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				FigureVanish{Tag = "default"},
			},
		};
		
		
		
		OnFigureRespawnEvent
		{

			WaitTime = (gtPersonalCounter[1])*2,
			X = (gtMyBed[individualsumme].X),
			Y = (gtMyBed[individualsumme].Y),
			Conditions = 
			{
				TimeIsBetween{StartHour = 6, EndHour = 20},
			},
			Actions =
			{
				EntityFlagSetTrue{Name = "ef_Respawned"},
			},
		},
		
		OnEvent
		{
			Conditions = 
			{
				EntityFlagIsTrue{Name = "ef_Respawned"},
			},
			Actions =
			{
				EntityFlagSetFalse{Name = "ef_Respawned"},
			},
			GotoState = "GotoPos0",
		},

}