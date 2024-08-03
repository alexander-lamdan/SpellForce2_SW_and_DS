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
		
		OnEvent
		{
			-- gehe in nächsten state, bzw. bei i == 9 zurück zum ersten
			GotoState = sNextState,
			Conditions = 
			{
				SetUpdateInterval{Steps = math.random(30, 50) / 10},
		   		AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = (i*10) + individualsumme },
		   		-- das loslaufen 6er gruppen noch auf mehrere steps verteilen
		   		--MapTimerIsElapsed {Name = "mt_ResidentTimer", Seconds = math.random(1, 50) / 10},
			},
			Actions = 
			{
				FigureWalk	{	X = (gtCoords[(gtPersonalCounter[i+1])].X), 
								Y = (gtCoords[(gtPersonalCounter[i+1])].Y),	},
			},
		},
	}
end
