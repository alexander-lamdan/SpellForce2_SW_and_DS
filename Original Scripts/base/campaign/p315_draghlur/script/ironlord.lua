State
{
	StateName = "Init",
	OnIdleGoHomeFake
	{
		X = 369,
		Y = 82,
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIntroDragEnd"},
		},
		Actions =
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_DealAccepted"},
			QuestIsActive {Quest = "FreeMordecayFromIronLord"},
		},
		Actions =
		{
			DialogTypeSetMainQuest {Tag = "IronLord"},
    		DialogSetEnabled {Tag = "IronLord"},
		}
	},
	
}