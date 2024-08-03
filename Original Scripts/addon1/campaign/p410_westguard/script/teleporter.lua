State
{	
	StateName = "INIT",
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleporterMistyCoast", Range = 3},
    		MapFlagIsTrue  {Name = "mf_TeleporterActivate"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 23, Y = 659},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam02"},
    		
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam02", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam02"},
   		},
    },
    
	
};
