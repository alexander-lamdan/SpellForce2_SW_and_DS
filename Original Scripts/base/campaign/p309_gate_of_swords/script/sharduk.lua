-- Sharduk erst da, wenn SPieler zurückkommt auf Golden Fields
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		--GotoState = "Guard",
		Conditions =
		{
			
		},
		Actions =
		{
		},
	},
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsSolved {Quest = "ForgeRing"},
		},
		Actions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureTeamIsInRange {Team = "tm_Hero", Range = 15, X = GetEntityX(), Y = GetEntityY()},
		},
		Actions =
		{
			FigureOutcry {Tag = "Sharduk", TextTag = "Sharduk1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Avatar1"},
			FigureOutcry {Tag = "Sharduk", TextTag = "Sharduk2"},
			FigureOutcry {Tag = "Sharduk", TextTag = "Sharduk3"},
		}
	}
}