

State
{
	StateName = "CultistState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			--QuestIsSolved	{Player = "pl_Human",Quest = "WestguardDefeatDemons"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_CultistAlive"},
    		DialogTypeSetSideQuest	{Tag = "Cultist"},
			DialogSetEnabled	{Tag = "Cultist"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CultistAttack"}, 
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Cultist"},
			FigureTeamTransfer	{Team = "tm_Untote"},
			MapFlagSetTrue{Name = "mf_CultisAttack"}, 
		},
		
	},
	

	
};


