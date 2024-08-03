-- Ablaufrätsel für das Pentagram



obenX = 177.8
obenY = 546
linksX = 152.6
linksY = 527.8
rechtsX = 201.6
rechtsY = 527.8
linksUntenX = 162.4
linksUntenY = 498.4
rechtsUntenX = 193.2
rechtsUntenY = 498.4
triggerRange = 7
firepod = 1228
firepodwithfire = 2063

-- Da das Ding etliche Events gleichzeitig laufen hat, wird es geparkt bis es wirklich bebraucht wird
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Riddle",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaInSecondPentagram"}
		},
		Actions =
		{
			ObjectSpawn {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectSpawn {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectSpawn {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectSpawn {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectSpawn {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
}

State
{
	StateName = "Riddle",
	-- Erster Step
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = linksX, Y = linksY, Range = triggerRange},
			EntityValueIsEqual {Value = 0, Name = "ev_P319_Riddle"},
			
		},
		Actions =
		{
			EntityValueSet {Value = 1, Name = "ev_P319_Riddle"},
			ObjectChange {ObjectId = firepodwithfire, X = linksX, Y = linksY, Tag = "Candle1"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = linksX, Y = linksY, Range = triggerRange},
			OR
			{
				EntityValueIsEqual {Value = 2, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 3, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 4, Name = "ev_P319_Riddle"},
			}
		},
		Actions =
		{
			EntityValueSet {Value = 0, Name = "ev_P319_Riddle"},
			--		
			ObjectChange {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectChange {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
	-- Zweiter Step
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = rechtsUntenX, Y = rechtsUntenY, Range = triggerRange},
			EntityValueIsEqual {Value = 1, Name = "ev_P319_Riddle"},
			
		},
		Actions =
		{
			EntityValueSet {Value = 2, Name = "ev_P319_Riddle"},
			ObjectChange {ObjectId = firepodwithfire, X = rechtsUntenX, Y = rechtsUntenY, Tag = "Candle2"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = rechtsUntenX, Y = rechtsUntenY, Range = triggerRange},
			OR
			{
				EntityValueIsEqual {Value = 3, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 4, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 5, Name = "ev_P319_Riddle"}
			}
		},
		Actions =
		{
			EntityValueSet {Value = 0, Name = "ev_P319_Riddle"},
			--		
			ObjectChange {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectChange {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
	-- Dritter Step
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = obenX, Y = obenY, Range = triggerRange},
			EntityValueIsEqual {Value = 2, Name = "ev_P319_Riddle"},
			
		},
		Actions =
		{
			EntityValueSet {Value = 3, Name = "ev_P319_Riddle"},
			ObjectChange {ObjectId = firepodwithfire, X = obenX, Y = obenY, Tag = "Candle3"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = obenX, Y = obenY, Range = triggerRange},
			OR
			{
				EntityValueIsEqual {Value = 4, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 0, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 1, Name = "ev_P319_Riddle"}
			}
		},
		Actions =
		{
			EntityValueSet {Value = 0, Name = "ev_P319_Riddle"},
			--		
			ObjectChange {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectChange {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
	-- Vierter Step
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = linksUntenX, Y = linksUntenY, Range = triggerRange},
			EntityValueIsEqual {Value = 3, Name = "ev_P319_Riddle"},
			
		},
		Actions =
		{
			EntityValueSet {Value = 4, Name = "ev_P319_Riddle"},
			ObjectChange {ObjectId = firepodwithfire, X = linksUntenX, Y = linksUntenY, Tag = "Candle4"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = linksUntenX, Y = linksUntenY, Range = triggerRange},
			OR
			{
				EntityValueIsEqual {Value = 2, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 0, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 1, Name = "ev_P319_Riddle"}
			}
		},
		Actions =
		{
			EntityValueSet {Value = 0, Name = "ev_P319_Riddle"},
			--		
			ObjectChange {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectChange {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
	-- Auch oben rechts muss die Kerzen löschen
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = rechtsX, Y = rechtsY, Range = triggerRange},
			OR
			{
				EntityValueIsEqual {Value = 2, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 0, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 1, Name = "ev_P319_Riddle"},
				EntityValueIsEqual {Value = 3, Name = "ev_P319_Riddle"},
			}
		},
		Actions =
		{
			EntityValueSet {Value = 0, Name = "ev_P319_Riddle"},
			--		
			ObjectChange {Tag = "Candle1", X = linksX, Y = linksY, ObjectId = firepod},
			ObjectChange {Tag = "Candle2", X = rechtsUntenX, Y = rechtsUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle3", X = obenX, Y = obenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle4", X = linksUntenX, Y = linksUntenY, ObjectId = firepod},
			ObjectChange {Tag = "Candle5", X = rechtsX, Y = rechtsY, ObjectId = firepod},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = rechtsX, Y = rechtsY, Range = triggerRange},
			EntityValueIsEqual {Value = 4, Name = "ev_P319_Riddle"}
		},
		Actions =
		{
			EntityValueSet {Value = 5, Name = "ev_P319_Riddle"},
			ObjectChange {Tag = "Candle5", ObjectId = firepodwithfire, X = rechtsX, Y = rechtsY}
		},
	},
}

State
{
	StateName = "End",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Teleporter anschalten, oder Flag dafür, mal sehn wie man das Handelt, weil das ja immer an sein muss
			-- muss ein Event sein, welches beim Wiederbetreten der Map wieder triggert, sonst aber nicht andauernd triggert
			
			MapFlagSetTrue {Name = "mf_P319_RiddleSolved"},
			ObjectSpawn {ObjectId = 1931, X = 177, Y = 518, Tag = "PlayerTeleport"}
		},
	},
}



