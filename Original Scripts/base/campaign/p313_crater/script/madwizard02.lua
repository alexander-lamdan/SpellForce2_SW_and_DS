
State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P313_CraterPlattformChange"},
			MapFlagIsTrue{Name = "mf_MadWizard01Killed"},
			MapFlagIsFalse{Name = "mf_MadWizard02Killed"},
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "ChestSkull01", Range = 15},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "ChestSkull02", Range = 15},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "ChestSkull03", Range = 15},	
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_MadWizard02Spawned"},
		},
	},
	
}
                                                    