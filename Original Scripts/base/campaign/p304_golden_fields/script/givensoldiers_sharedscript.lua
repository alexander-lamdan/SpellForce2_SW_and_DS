
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_GiveSoldierTroops"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
			FigurePlayerTransfer{Tag = "default", Player = "pl_Human"},
		},
	},
}
