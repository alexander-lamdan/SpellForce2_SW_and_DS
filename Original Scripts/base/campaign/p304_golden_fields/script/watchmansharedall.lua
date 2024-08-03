gtCoords =                    
{                             
  [1] = { X = 522.67, Y = 366.935 }, 
  [2] = { X = 524.029, Y = 348.37 }, 
  [3] = { X = 527.154, Y = 316.924 }, 
  [4] = { X = 582.816, Y = 316.031 }, 
  [5] = { X = 586.778, Y = 364.129 }, 
  [6] = { X = 565.937, Y = 398.201 }, 
  [7] = { X = 523.125, Y = 395.024 },                          
}                             



-- für jeden punkt eigenen state erzeugen
for i = 0, 6 do
	
	-- die statenamen durchnummerieren
	local sState, sNextState
	sState = "GotoPos" .. i
	if i == 6 then
		sNextState = "GotoPos0"
	else
		sNextState = "GotoPos" .. (i+1)
	end

	State
	{	
		StateName = sState,
		
		OnEvent
		{
			-- gehe in nächsten state, bzw. bei i == 6 zurück zum ersten
			GotoState = sNextState,
			Conditions = 
			{
		   		-- das loslaufen 6er gruppen noch auf mehrere steps verteilen
				SetUpdateInterval {Steps = math.random(40, 60)},
		   		MapValueIsEqual{Name = "mv_WatchmanCounter", Value = i+1},
			},
			Actions = 
			{
				FigureWalk	{	X = (gtCoords[(gtPersonalCounter[i+1])].X), 
								Y = (gtCoords[(gtPersonalCounter[i+1])].Y),	},
			},
		},
		


		
		OnOneTimeEvent
		{
			Conditions =
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 9 },
				MapFlagIsFalse{Name = "mf_WatchmenGetAggro"},
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 140, Amount = 1},
				-- wenn Spieler Tageseinnahmen hat
	
			},
			Actions =
			{
				FigureOutcry{TextTag = "NightWatchmanAlert01", Tag = "Watchman01"},
				MapFlagSetTrue{Name = "mf_WatchmenGetAggro"},
			},
		},
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_WatchmenGetAggro"},
			},
			Actions =
			{
				FigureTeamTransfer{Tag = "default", Team = "tm_Team2"},
				FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
			},
			
		},
	}
end



