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
			FigureUnitChange	{UnitId = 792, Level = 20},
			--FigureDirectionSet	{Tag = "default", Direction = 300},
			FigureDirectionSetToEntity	{Tag = "default", TargetTag = "TransformLever6"},
		},
	},

	-- delay anschalten vom dialog, weil er sich erst selbst abschaltet über die dialog statemachine
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "RightTwist2SearchProf"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_TwiddleDialogEnable"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_TwiddleDialogEnable", Seconds = 0.3},
		},
		Actions =
		{
			DialogSetEnabled	{},
			DialogTypeSetSideQuest	{},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "RightTwist2MeetProfGoS"},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "default", File = "Effect_DeSpawn_Unit"},
			EntityTimerStart	{Name = "et_VanishMe"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_VanishMe", Seconds = 2.5},
		},
		Actions =
		{
			FigureVanish	{Tag = "default"},
		},
	},
}