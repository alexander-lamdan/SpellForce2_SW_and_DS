-----.-----------------------------------------------------------------
----
----   Falle, die den Spieler mit einem bösen Gegner einsperrt (Test)
----
-----------------------------------------------------------------------

trapPosX = 455
trapPosY = 384
--killRange = 10
triggerRange = 5


State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			ObjectVanish {Tag = "Falle6"},
			ObjectVanish {Tag = "Falle6a"},
			ObjectVanish {Tag = "Falle6b"},
			ObjectVanish {Tag = "Falle6c"},
			ObjectVanish {Tag = "Falle6d"},
			ObjectVanish {Tag = "Falle6e"},
			ObjectVanish {Tag = "Falle6f"},
			ObjectVanish {Tag = "Falle6g"},

			
		}   
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
			PlayerFigureIsInRange {X = trapPosX, Y = trapPosY, Range = triggerRange},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			ObjectSpawn {Tag = "Pallisade1", ObjectId = 316, X = 447.214, Y = 392.363, Direction = 0},
			ObjectSpawn {Tag = "Pallisade2", ObjectId = 316, X = 448.149, Y = 384.045, Direction = 90},
			ObjectSpawn {Tag = "Pallisade3", ObjectId = 316, X = 448.224, Y = 375.87, Direction = 90},
			ObjectSpawn {Tag = "Pallisade4", ObjectId = 316, X = 456.442, Y = 376.105, Direction =  180},
		                
			ObjectSpawn {Tag = "Pallisade5", ObjectId = 316, X = 464.284, Y = 375.996, Direction = 180},
			ObjectSpawn {Tag = "Pallisade6", ObjectId = 316, X = 463.453, Y = 384.032, Direction = 270},
			ObjectSpawn {Tag = "Pallisade7", ObjectId = 316, X = 463.579, Y = 392.425, Direction = 270},
			ObjectSpawn {Tag = "Pallisade8", ObjectId = 316, X = 463.073, Y = 392.221, Direction =  180},
			MapFlagSetTrue {Name = "mf_P315_Trap6Triggered"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			EntityTimerStart {Name = "et_P315_PalisadenDespawn"}
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "TrapMonster1"},
			MapFlagIsTrue {Name = "mf_P315_Trap6Triggered"},
			EntityTimerIsElapsed {Name = "et_P315_PalisadenDespawn", Seconds = 10}
		},
		Actions =
		{
			ObjectVanish {Tag = "Pallisade1"},
			ObjectVanish {Tag = "Pallisade2"},
			ObjectVanish {Tag = "Pallisade3"},
			ObjectVanish {Tag = "Pallisade4"}, 
			ObjectVanish {Tag = "Pallisade5"},
			ObjectVanish {Tag = "Pallisade6"},
			ObjectVanish {Tag = "Pallisade7"},
			ObjectVanish {Tag = "Pallisade8"},
		}
	},
	-- Sind Einzelevents Pro entschärfer, da auch der jeweilige den Outcry absetzen muss
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer1"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer1"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			FigureStop {Tag = "Pioneer1"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer2"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer2"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			FigureStop {Tag = "Pioneer2"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer3"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer3"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			FigureStop {Tag = "Pioneer3"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer4"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer4"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			FigureStop {Tag = "Pioneer4"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer5"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer5"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
			FigureStop {Tag = "Pioneer5"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			QuestIsSolved {Quest = "WatchOutForTraps"}
		},
		Actions =
		{
		}
	}
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
		}
		
	},
}