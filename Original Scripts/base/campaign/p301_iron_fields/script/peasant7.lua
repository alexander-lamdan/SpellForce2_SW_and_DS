--------------------------------------------------------
--
--		Dorfbewohner kämpft mit Elfen
--
--------------------------------------------------------

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"}
		},
		Actions =
		{
			FigureVanish {},
		},
	},
	OnIdleGoHomeFake
	{
		X = 179,
		Y = 589,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialThora"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		}
	}
}



