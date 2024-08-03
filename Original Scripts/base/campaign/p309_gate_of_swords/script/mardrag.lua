State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Race",
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_P309_CutsceneOracleMid"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P309_OrcHeadstart"},
		},
	},
}
	
-- Rennen um die BLuemen mit dem Ork
State
{
	StateName = "Race",
	-- Der Ork rennt ein wenig vor, dann wird er Aggro, damit er nicht direkt am start den Spieler angreift, es dann aber später zum Kampf kommen kann
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P309_OrcHeadstart", Seconds = 30},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Mardrag", Team = "tm_EnemyPact"},
		}
	},
	OnIdleRunHomeFake
	{
		X = 105, Y = 462, --ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 0},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 1},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 153, Y = 553, --ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 1},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 2},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 240, Y = 497,--ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 2},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 3},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 153, Y = 303,  --ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 3},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 4},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 116, Y = 347,--ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 4},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 5},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 202, Y = 552, --ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 5},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 6},	
		},
	},
	OnIdleRunHomeFake
	{
		X = 150, Y = 584,--ok
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_CutsceneBackToOracleBegin"},
			EntityValueIsEqual	{Name = "ev_Racestate", Value = 1},
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Racestate", Value = 2},	
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P309_CutsceneMadragNeutral"},
		},
		Actions = 
		{
			FigureTeamTransfer {Tag = "Mardrag", Team = "tm_Neutral"},
		},
	};

	
	--OnOneTimeEvent
	--{
	--	--GotoState = "",
	--	Conditions =
	--	{
	--		FigureIsInEntityRange {Tag = "Berserker", TargetTag = "pl_HumanAvatar", Range = 3},
	--		QuestIsActive {Quest = "SaveMordecayFromArena"}
	--	},
	--	Actions =
	--	{
	--		-- !!! Wenn er denn mal da ist einen Forced Attack auf den Spieler hier starten
	--	},
	--},
	
}