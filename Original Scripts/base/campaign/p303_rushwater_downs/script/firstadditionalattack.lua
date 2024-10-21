-- Erster Angriff auf den Convoi, direkt nach der CS
State
{
	StateName = "INIT",
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		AvatarFlagIsTrue {Name = "af_P303_Todesblocker"},
	--	},
	--	Actions =
	--	{
	--		EntityTimerStart {Name = "et_P309_AdditionalAttackDelay"},
	--	}
	--},
	--DerAngriff beginnt erst wenn der Spieler was macht
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsNotInRange {X = 117, Y = 160, Range = 8, Tag = "pl_HumanNightSong"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy1"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy2"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy3"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy4"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy5"},
				FigureIsNotInRange {X = 120, Y = 146, Range = 8, Tag = "PlayerArmy6"},
				FigureIsNotInRange {X = 117, Y = 161, Range = 8, Tag = "pl_HumanAvatar"},
				FigureIsNotInRange {X = 117, Y = 161, Range = 8, Tag = "pl_HumanHeroBor"},
				FigureIsNotInRange {X = 117, Y = 161, Range = 8, Tag = "pl_HumanHeroLya"},
			},
			AvatarFlagIsTrue {Name = "af_P303_Todesblocker"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P309_AdditionalAttackDelay"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "AdditionalAttack1", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "AdditionalAttack2", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "AdditionalAttack3", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "AdditionalAttack4", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "AdditionalAttack5", TargetTag = "ConvoyLeader"},
			
			FigureRun {Tag = "AdditionalAttack1", X = 126, Y = 130},
			FigureRun {Tag = "AdditionalAttack2", X = 126, Y = 130},
			FigureRun {Tag = "AdditionalAttack3", X = 126, Y = 130},
			FigureRun {Tag = "AdditionalAttack4", X = 126, Y = 130},
			FigureRun {Tag = "AdditionalAttack5", X = 126, Y = 130},
		}
	}
}