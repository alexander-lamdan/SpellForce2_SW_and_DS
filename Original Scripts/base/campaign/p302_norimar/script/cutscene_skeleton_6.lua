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
	},
	OnOneTimeEvent
	{ 
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_norimar_skirmish_end"},
		},
		Actions = 
		{
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "default"},
			FigureWalk {Tag = "default", X = 546, Y = 133},
		},
		GotoState = "EndScript",
	},
};

State
{
	StateName = "EndScript",
};

