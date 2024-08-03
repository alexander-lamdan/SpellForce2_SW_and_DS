
State
{
	StateName = "AyaState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P300_WestguardStartQuestBeastDefense"}, 
			MapFlagIsTrue {Name = "mf_Halicos_Spawn"},
			PlayerBuildingIsNotInRange	{Player = "pl_Beasts", BuildingId = 0, Range = 10, X = 154.55, Y = 123.165},
			PlayerFigureIsNotInRange	{Player = "pl_Beasts", Range = 10, X = 154.55, Y = 123.165},
		},
		Actions = 
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Aya"},
			MapFlagSetTrue {Name = "mf_AyaAlive"},
			FigureOutcry	{TextTag = "AyaAttacks1", Tag = "Aya"},
			FigureOutcry	{TextTag = "AyaAttacks2", Tag = "TorHalicos"},
		},
	},	
	
	

};
