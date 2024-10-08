
HomePointBetaX = 325 --320
HomePointBetaY = 93.8 --110




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
	--Wenn die Flagge verloren wurde werden die Defender im Hauptlager respawned und versuchen dann die Flagge zur�ckzuerobern
	StateName = "FlagDefenderState",
	OnFigureRespawnEvent
	{
		WaitTime = 180,
		X = HomePointBetaX,
		Y = HomePointBetaY,
		Conditions = 
		{
			PlayerBuildingIsInRange	{Player = "pl_SchattenTeamBeta", BuildingId = 147, Range = 10, X = HomePointBetaX, Y = HomePointBetaY},
			--MapFlagIsFalse {Name = "mf_BetaHauptlagerEingenommen"},
		},
		Actions = 
		{
			FigureRunToEntity	{TargetTag = "InvisibleBoxFlagBeta06"},
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
			FigureIsInEntityRange	{Tag = "FlagBeta01Defender01", TargetTag = "InvisibleBoxFlagBeta06", Range = 8},
			FigureIsInEntityRange	{Tag = "FlagBeta01Defender02", TargetTag = "InvisibleBoxFlagBeta06", Range = 8},
			EntityFlagIsFalse	{Name = "ef_CasterHoldPosition"},
		},
		Actions =
		{
			FigureHoldPosition	{Tag = "FlagBeta06Defender01"},
			FigureHoldPosition	{Tag = "FlagBeta06Defender02"},
			EntityFlagSetTrue	{Name = "ef_CasterHoldPosition"},
		},
		
	},


   
   
				
   
};

