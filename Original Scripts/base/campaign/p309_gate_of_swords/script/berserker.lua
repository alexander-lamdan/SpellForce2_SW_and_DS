

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent 
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P307_DealAccepted"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_BerserkerSpawnBlocker"},
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		},
	},
}
	
