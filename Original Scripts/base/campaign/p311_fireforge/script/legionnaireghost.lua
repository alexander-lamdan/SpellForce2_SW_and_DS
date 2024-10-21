State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_ThirdWaveDead"}
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_P311_Dialog"},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P311_Dialog", Seconds = 1}
		},
		Actions =
		{
			EntityTimerStop {Name = "et_P311_Dialog"},
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IronFalconGhost"},
			MapFlagIsTrue {Name = "mf_P311_IronFalconGhostSpawned"}
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "LegionnaireGhost", Team = "tm_Neutral"},
		}
	},
	-- Wenn der Mohr seine Schuldigkeit getan hat, kann er gehen
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DarkLegionReturnMorca"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureVanish {},
		}
	}
}