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
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager001"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager002"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager003"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager004"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager005"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager006"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager007"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager008"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager009"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager010"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager011"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager012"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager013"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager014"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager015"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager016"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager017"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager018"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager019"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager020"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager021"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager022"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager023"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager024"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager025"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager026"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager027"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager028"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager029"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Cutscene_Villager030"},
		},
	};
	OnOneTimeEvent  -- Wenn der Spieler auf der Brücke ist, werden die Kämpfenden im Dorf gelöscht
	{
		Conditions = 
		{
			PlayerFigureIsInRange {Player = "pl_Human", Range = 10, X = 495.6, Y = 537.6},
		},
		Actions = 
		{
			FigureVanish {Tag = "Cutscene_Villager001"},
			FigureVanish {Tag = "Cutscene_Villager002"},
			FigureVanish {Tag = "Cutscene_Villager003"},
			FigureVanish {Tag = "Cutscene_Villager004"},
			FigureVanish {Tag = "Cutscene_Villager005"},
			FigureVanish {Tag = "Cutscene_Villager006"},
			FigureVanish {Tag = "Cutscene_Villager007"},
			FigureVanish {Tag = "Cutscene_Villager008"},
			FigureVanish {Tag = "Cutscene_Villager009"},
			FigureVanish {Tag = "Cutscene_Villager010"},
			FigureVanish {Tag = "Cutscene_Villager011"},
			FigureVanish {Tag = "Cutscene_Villager012"},
			FigureVanish {Tag = "Cutscene_Villager013"},
			FigureVanish {Tag = "Cutscene_Villager014"},
			FigureVanish {Tag = "Cutscene_Villager015"},
			FigureVanish {Tag = "Cutscene_Villager016"},
			FigureVanish {Tag = "Cutscene_Villager017"},
			FigureVanish {Tag = "Cutscene_Villager018"},
			FigureVanish {Tag = "Cutscene_Villager019"},
			FigureVanish {Tag = "Cutscene_Villager020"},
			FigureVanish {Tag = "Cutscene_Villager021"},
			FigureVanish {Tag = "Cutscene_Villager022"},
			FigureVanish {Tag = "Cutscene_Villager023"},
			FigureVanish {Tag = "Cutscene_Villager024"},
			FigureVanish {Tag = "Cutscene_Villager025"},
			FigureVanish {Tag = "Cutscene_Villager026"},
			FigureVanish {Tag = "Cutscene_Villager027"},
			FigureVanish {Tag = "Cutscene_Villager028"},
			FigureVanish {Tag = "Cutscene_Villager029"},
			FigureVanish {Tag = "Cutscene_Villager030"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};