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
			EntityTimerStart {Name = "et_P309_MordecayDelay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene05"}, -- brauch ich zum Testen für die Cutscene
				AND
				{
					AvatarFlagIsTrue {Name = "af_P307_DealAccepted"},
					EntityTimerIsElapsed {Name = "et_P309_MordecayDelay", Seconds = 1},
				},
			},
		},
		Actions = 
		{
			-- Wird getauscht, nicht gespawnt
			ObjectChange {Tag = "default", ObjectId = 1694, X = default, Y = default, Direction = default},
			--ObjectSpawn {ObjectId = 848, X = 570.756, Y = 414.565, Direction = 177.617, Tag = "Mordecay"},
		},
	};
	--OnFigureRespawnEvent
	--{
	--	X = GetEntityX(), 
	--	Y = GetEntityY(),
	--	WaitTime = 1,
	--	Conditions = 
	--	{
	--		AvatarFlagIsFalse {Name = "af_P307_DealAccepted"},
	--		EntityTimerIsElapsed {Name = "et_P309_MordecayDelay", Seconds = 1},
	--		
	--	},
	--	Actions = 
	--	{
	--		
	--	},
	--};
	
}
	
-- Mordecay liegt da so rum
State
{
	StateName = "Idle",
	
}


