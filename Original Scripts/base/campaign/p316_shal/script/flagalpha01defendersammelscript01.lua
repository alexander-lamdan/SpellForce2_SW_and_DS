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
			-- NOTE: überflüssig:
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
			-- NOTE: forced run bei normalen militärischen einheiten ist BAAAAAAAD!
			-- dann laufen die nämlich durch alle Spielereinheiten durch, ohne sich zu wehren,
			-- in dem verzweifelten Versuch eine längst hoffnungslos verlorene Flagge wieder einzunehmen
			-- auf jeden fall: RunToEntity macht die Sache wesentlich einfacher
			
			FigureRunToEntity	{TargetTag = "InvisibleBoxAlpha01"},
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
		
			FigureIsInEntityRange	{Tag = "FlagAlpha01Defender09", TargetTag = "InvisibleBoxAlpha01", Range = 8},
			EntityFlagIsFalse	{Name = "ef_CasterHoldPosition"},
		},
		Actions =
		{
			-- NOTE: bezweifle, das hold position hier von vorteil ist, besser das der KI/Combat überlassen
			FigureHoldPosition	{Tag = "FlagAlpha01Defender09"},
			EntityFlagSetTrue	{Name = "ef_CasterHoldPosition"},
		},
		
	},

   
   
				
   
};

