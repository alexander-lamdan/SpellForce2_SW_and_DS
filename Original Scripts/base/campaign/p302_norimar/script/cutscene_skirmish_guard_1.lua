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
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "default"},
		},
		GotoState = "EndScript",
	},
};

State
{
	StateName = "EndScript",
};

