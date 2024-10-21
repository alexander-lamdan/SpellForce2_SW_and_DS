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
			EntityTimerStart	{Name = "et_EnableDialog"},
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
			-- nur beim ersten spawn die outcries abwarten, sonst Dialog gleich anschalten
			OR
			{
				EntityTimerIsElapsed	{Name = "et_EnableDialog", Seconds = 16},
				AND
				{
					MapFlagIsTrue	{Name = "mf_SQWarrior_ArchonDied"},
					EntityTimerIsElapsed	{Name = "et_EnableDialog", Seconds = 2},
				},
			},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_EnableDialog"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
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
	};
}

State	{StateName = "END"};
