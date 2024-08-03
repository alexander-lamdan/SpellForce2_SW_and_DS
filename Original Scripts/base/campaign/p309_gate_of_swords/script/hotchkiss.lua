-- Der Steinerne Gott ist enttarnt Hotchkiss spawnt
State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarIsNotTalking{},
			MapFlagIsTrue{Name = "mf_P309_StonedGodExposed"},
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_P309_HotchkissDelay"},
			FigureOutcry {TextTag = "HotchKiss1"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P309_HotchkissDelay", Seconds = 2},
		},
		Actions =
		{
			DialogTypeSetMainQuest {Tag = "Hotchkiss"},
			DialogSetEnabled {Tag = "Hotchkiss"},
		}
	}
}