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
			--MapFlagIsFalse {Name = "mf_AlphaHauptlagerEingenommen"},
			PlayerBuildingIsInRange	{Player = "pl_SchattenTeamAlpha", BuildingId = 147, Range = 10, X = HomePointAlphaX, Y = HomePointAlphaY},
		},
		Actions = 
		{
			FigureRunToEntity	{TargetTag = "InvisibleBoxAlpha05"},
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
		
			FigureIsInEntityRange	{Tag = "FlagAlpha05Defender01", TargetTag = "InvisibleBoxAlpha05", Range = 8},
			EntityFlagIsFalse	{Name = "ef_CasterHoldPosition"},
		},
		Actions =
		{
			
			FigureHoldPosition	{Tag = "FlagAlpha05Defender01"},
			EntityFlagSetTrue	{Name = "ef_CasterHoldPosition"},
		},
		
	},

   
   
				
   
};

