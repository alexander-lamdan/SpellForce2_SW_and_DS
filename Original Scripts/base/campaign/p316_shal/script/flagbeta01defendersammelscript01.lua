HomePointBetaX = 325 --320
HomePointBetaY = 93.8 --110

State
{
	--Wenn die Flagge verloren wurde werden die Defender im Hauptlager respawned und versuchen dann die Flagge zurückzuerobern
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
			FigureRunToEntity	{TargetTag = "InvisibleBoxFlagBeta01"},
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
			FigureIsInEntityRange	{Tag = "FlagBeta01Defender07", TargetTag = "InvisibleBoxFlagBeta01", Range = 8},
			FigureIsInEntityRange	{Tag = "FlagBeta01Defender08", TargetTag = "InvisibleBoxFlagBeta01", Range = 8},
			FigureIsInEntityRange	{Tag = "FlagBeta01Defender09", TargetTag = "InvisibleBoxFlagBeta01", Range = 8},
			EntityFlagIsFalse	{Name = "ef_CasterHoldPosition"},
		},
		Actions =
		{
			FigureHoldPosition	{Tag = "FlagBeta02Defender07"},
			FigureHoldPosition	{Tag = "FlagBeta02Defender08"},
			FigureHoldPosition	{Tag = "FlagBeta02Defender09"},
			EntityFlagSetTrue	{Name = "ef_CasterHoldPosition"},
		},
		
	},

   
   
				
   
};

