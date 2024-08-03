-- für jeden punkt eigenen state erzeugen
for i = 0, 19 do
	
	-- die statenamen durchnummerieren
	local sState, sNextState
	sState = "GotoPos" .. i
	if i == 19 then
		sNextState = "GotoPos0"
	else
		sNextState = "GotoPos" .. (i+1)
	end

	State
	{	
		StateName = sState,

		--Stop, wenn befreit und dem Spieler uebergeben
		OnOneTimeEvent
		{
			GotoState = "Stop",
			Conditions =
			{
				MapFlagIsTrue	{Name = "mf_Exhauster" .. ExhausterNum .. "Unbanned"}, 
			},
			Actions =
			{
			},
		},
		
		OnEvent
		{
			-- gehe in nächsten state, bzw. bei i == 19 zurück zum ersten
			GotoState = sNextState,
			Conditions = 
			{
		   		-- das loslaufen 6er gruppen noch auf mehrere steps verteilen
				SetUpdateInterval {Steps = math.random(40, 60)},
		   		AvatarValueIsEqual{Name = "av_P306_ResidentCounter", Value = (i*10) + individualsumme },
		   		-- alter verteiler:
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

-- hier wird das elfenscript "geparkt" wenn sie dem spieler gehören
State
{	
	StateName = "Stop",
}
