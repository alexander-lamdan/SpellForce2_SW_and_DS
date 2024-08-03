

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "3_KapitelAkt2"},
		},
		DelayedActions =
		{
			DialogTypeSetMainQuest {Tag = "ShadowWarrior"},
			DialogSetEnabled {Tag = "ShadowWarrior"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P309_ShadowDialogA"},
	 		EntityFlagIsTrue {Name = "ef_P309_ShadowDialogB"},
		},
		Actions =
		{
			DialogSetDisabled {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DefeatNaugron"},
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Die erste Quest auf Tuscari sorgt dafür, dass der Schattenkriegere despawnt
			QuestIsKnown {Quest = "FreeOrcsInFortress"},
		},
		Actions =
		{
			FigureVanish {},
		}
	}
		
}