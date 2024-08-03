State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Attack",
		Conditions = 
		{
			
		},
		Actions = 
		{
		},
	},


};

State
{
	StateName = "Attack",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_KonvoiGo"},
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_UndeadCamp1Delay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_UndeadCamp1Delay", Seconds = 30},
		},
		Actions = 
		{
			PlayerActivate	{Player = "pl_UndeadCamp1"},	
		},
	},	
			
		

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_UndeadCamp01Destroyed"},
		},
		Actions = 
		{
			PlayerActivate	{Player = "pl_UndeadCamp2"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_UndeadCamp02Destroyed"},
		},
		Actions = 
		{
			PlayerActivate	{Player = "pl_UndeadCamp3"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_UndeadCamp03Destroyed"},
		},
		Actions = 
		{
			PlayerActivate	{Player = "pl_UndeadCamp4"},
		},
	},
	
};

