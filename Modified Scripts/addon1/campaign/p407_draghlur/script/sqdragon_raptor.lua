local tPathPoints = {}

for i = 1, 8 do
	local tPoint = 
	{
		Point = "SQDragon_RaptorPath" .. i,	-- zielfigur/object (wenn figurentag, dann muss follow an sein!)
		--WaitTime = 30,			-- hier x steps warten
		--Direction = math.random(1, 360),        -- an dem punkt in diese richtung blicken (erfordert waittime > 0)
		Range = 5,          -- wie nah die figur ranlaufen soll an den punkt
		GotoMode = "Run", -- walkmodes: "run", "walk", "simple", "forced" in einem string
	}
	
	if i == 1 then
		tPoint.Loop = true
	end

	table.insert(tPathPoints, tPoint)
end

PathStates
{
   StateName = "RaptorPathing",  -- kann mit gotostate angesprungen werden
   --GotoState = ,               -- wenn stopconditions wahr, wird in diesen state gewechselt
   Conditions = {},            -- müssen wahr sein damit figur losläuft
   Actions = {},               -- wird beim loslaufen ausgeführt
   --StopConditions = {},        -- bricht das laufen ab, figur stoppt
   Points = tPathPoints,                   -- 2 oder mehr pfadpunkte, die mind. einen 'Point' Parameter haben müssen, s.u.
}

--State
--{
--	StateName = "INIT",
--
--	OnEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--			FigurePathGoto	
--			{
--				Goto = FigurePatrolWalkToEntity	{TargetTag = "SQDragon_RaptorPath1"},
--				Tags = 
--				{
--					"SQDragon_RaptorPath2",
--					"SQDragon_RaptorPath3",
--					"SQDragon_RaptorPath4",
--					"SQDragon_RaptorPath5",
--					"SQDragon_RaptorPath6",
--					"SQDragon_RaptorPath7",
--					"SQDragon_RaptorPath8",
--				},
--			},
--		},
--		GotoState = "END",
--	};
--};
--
--State	{StateName = "END"};
