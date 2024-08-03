State
{
	StateName = "INIT",
	--Timer fuer loslaufen nach CS Intro
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha1",
		GotoState = self,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CS_IntroDone"},	
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_ShaeGotoSansha"},
			
		},
	};
	
	--Shae lauft los, wartet aber an der Ecke
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha2",
		GotoState = self,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CS_IntroDone"},	
			MapTimerIsElapsed {Name = "mt_ShaeGotoSansha", Seconds = 2},
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = 401, Y = 415}, --an der Ecke	
		},
	};
	
	--Shae OC: Info ueber Koenigin
	OnOneTimeEvent
	{
		EventName = "OC_FollowToSansha01",
		GotoState = self,
		Conditions = 
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 2},
			MapTimerIsElapsed {Name = "mt_ShaeGotoSansha", Seconds = 4},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Shae5", Tag = "default"}, --beim Vorausrennen zur Koenigin
			FigureOutcry	{TextTag = "Shae6", Tag = "default"},
		},
	};
	
	--Wenn Avatar nachgekommen, Shae weiter zum Reisestein
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha3",
		GotoState = self,
		Conditions = 
		{
				
			--MapTimerIsElapsed {Name = "mt_ShaeGotoSansha", Seconds = 6},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = 401, Y = 415},
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = 369, Y = 396},

		},
	},
	
	--Wenn Avatar nahe, Shae weiter zur Koenigin
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha4",
		GotoState = self,
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = 369, Y = 396},
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = 323, Y = 374},
			
		},
	},
	
	
	--Wenn Shae bei Sansha angekommen: Flag setzen
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha5",
		GotoState = self,
		Conditions = 
		{
			FigureIsInRange	{Tag = "default", Range = 3, X = 320, Y = 375},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_ShaeArrivedAtSansha"},	
		},
	},
	
	
	------------------------------------------
	--falls Avatar anderen Weg nimmt, Shae nachschicken, wenn Avatar alleine zu sansha gelaufen ist
	OnOneTimeEvent
	{
		EventName = "ShaeGotoSansha6",
		GotoState = self,
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 323, Y = 374},
			MapFlagIsFalse	{Name = "mf_ShaeArrivedAtSansha"},	
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = 323, Y = 374},
			
		},
	},
	
};

