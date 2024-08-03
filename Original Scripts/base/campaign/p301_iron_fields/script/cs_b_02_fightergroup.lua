State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_B_02_Fighter_Group_Spawn"},
		},
		DelayedActions =
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "default"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_B_02_Fighter_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		},
		GotoState = "ScriptEnd",
	},
};

State
{
	StateName = "ScriptEnd",
};