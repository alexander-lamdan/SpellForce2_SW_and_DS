State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish	{},
		},
		GotoState = "Respawn",
	},
};
	
State
{
	StateName = "Respawn",

	OnFigureRespawnEvent
	{
		WaitTime = 0,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_StartTrial"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureTeamTransfer	{Team = "tm_Neutral"},
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	};

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_ScriptEnd"},
		},
		Actions =
		{
		},
		GotoState = "END",
	},
}

State	{StateName = "END"};
