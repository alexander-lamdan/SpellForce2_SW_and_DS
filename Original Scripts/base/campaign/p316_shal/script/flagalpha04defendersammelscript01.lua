HomePointAlphaX = 35 --50
HomePointAlphaY = 266 --270





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
			EntityFlagSetFalse	{Name = "ef_CasterHoldPosition"},
		},
		GotoState = "FlagDefenderState",
	},
}

State
{
	--Wenn die Flagge verloren wurde werden die Defender im Hauptlager respawned und versuchen dann die Flagge zurückzuerobern
	StateName = "FlagDefenderState",
	OnFigureRespawnEvent
	{
		WaitTime = 180,
		X = HomePointAlphaX,
		Y = HomePointAlphaY,
		Conditions = 
		{
			PlayerBuildingIsInRange	{Player = "pl_SchattenTeamAlpha", BuildingId = 147, Range = 10, X = HomePointAlphaX, Y = HomePointAlphaY},
			--MapFlagIsFalse {Name = "mf_AlphaHauptlagerEingenommen"},
		},
		Actions = 
		{
			FigureRunToEntity	{TargetTag = "InvisibleBoxAlpha04"},
			EntityFlagSetFalse	{Name = "ef_CasterHoldPosition"},
		},
		DeathActions = 
		{
			
		},
	},
	OnEvent
	{
		Conditions =
		{
		
			FigureIsInEntityRange	{Tag = "FlagAlpha04Defender09", TargetTag = "InvisibleBoxAlpha04", Range = 8},
			EntityFlagIsFalse	{Name = "ef_CasterHoldPosition"},
		},
		Actions =
		{
			
			FigureHoldPosition	{Tag = "FlagAlpha04Defender09"},
			EntityFlagSetTrue	{Name = "ef_CasterHoldPosition"},
		},
		
	},

   
   
				
   
};

