-- Hilfsskript um Trennung zwischen Tutorial und Mission vorzunehmen


State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		GotoState = "Tutorial",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P301_IronFieldsTutorial"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Mission",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
		},
		Actions =
		{
			
		},
	},
}

State
{
	StateName = "Tutorial",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "Avatar666", Tag = "pl_HumanAvatar"},
			--TutorialText	{TextTag = "Tutorial1"},
			--TutorialText	{TextTag = "Tutorial2"},
			--TutorialText	{TextTag = "Tutorial3"},
		}
	}
}

State
{
	StateName = "Mission",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			
			
		}
	}
}