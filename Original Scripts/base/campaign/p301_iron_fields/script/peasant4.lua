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
		X = 210,
		Y = 583,
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



