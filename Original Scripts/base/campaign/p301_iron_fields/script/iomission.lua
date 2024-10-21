State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
		},
		Actions =
		{
		 	FigureAbilityAdd {AbilityId = Ability.Immortal}
		}
	},
}
	
