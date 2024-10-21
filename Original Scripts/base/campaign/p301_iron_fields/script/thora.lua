--------------------------------------------------------
--
--		Thora taucht abhängig von der Spielsituation an verschiedenen Orten auf
--
--------------------------------------------------------

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
			FigureVanish {Tag = "Thora"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P301_Tutorial"},
				MapFlagIsTrue {Name = "mf_P301_NoTutorial"},
			},
			MapFlagIsTrue {Name = "mf_P301_DamnedTutorialOver"},
			EntityFlagIsFalse {Name = "ef_P301_ThoraStanding"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_P301_ThoraStanding"}
		},
		DelayedActions =
		{
			FigureRun {Tag = "Thora", X = 270, Y = 641},
		}
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Attacker"},
			MapFlagIsTrue {Name = "mf_P301_Tutorial"},
		},
		Actions =
		{
			DialogTypeSetMainQuest {Tag = "Thora"},
    		DialogSetEnabled {Tag = "Thora"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 210,
		Y = 583,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialThora"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		HomeActions =
		{
			FigureLookAtDirection {Direction = 90},
		}
	}
}



