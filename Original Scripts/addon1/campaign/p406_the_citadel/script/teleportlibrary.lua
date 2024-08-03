--*******************************************************
--***                                                 ***
--***               Citadel Addon1					  ***
--***			    TeleportLibrary	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_GuardianDead"},
			--PlayerBuildingIsNotInEntityRange	{Player = "pl_Gegner1", BuildingId = 0, Range = 20, TargetTag = "TeleportLibrary"},
			PlayerHasNotBuildingAmount	{Player = "pl_Gegner1", Amount = 1, OnlyCompleted = default},
			PlayerFigureIsNotInRangeToEntity	{Player = "pl_Gegner1", Range = 20, TargetTag = "TeleportLibrary"},
			PlayerFigureIsNotInRangeToEntity	{Player = "pl_Gegner2", Range = 20, TargetTag = "TeleportLibrary"},
			PlayerFigureIsNotInRangeToEntity	{Player = "pl_Gegner3", Range = 20, TargetTag = "TeleportLibrary"},
			PlayerFigureIsNotInRangeToEntity	{Player = "pl_Gegner4", Range = 20, TargetTag = "TeleportLibrary"},
		},
		OnActions = 
		{
			
			ObjectChange	{Tag = "TeleportLibrary", ObjectId = 1432, X = 482, Y = 480, Direction = 0},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_teleport_light", X = 482, Y = 25, Z = 480, MaxRange = 15, FallOffRange = 5},
			MapFlagSetTrue {Name = "mf_TeleportLibraryActive"},
		},
		OffConditions =
		{
			MapFlagIsTrue {Name = "mf_GuardianDead"},
			--PlayerBuildingIsInEntityRange	{Player = "pl_Gegner1", BuildingId = 0, Range = 20, TargetTag = "TeleportLibrary"},
			PlayerHasBuildingAmount	{Player = "pl_Gegner1", Amount = 1, OnlyCompleted = default},
			OR
			{
				PlayerFigureIsInRangeToEntity	{Player = "pl_Gegner1", Range = 20, TargetTag = "TeleportLibrary"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Gegner2", Range = 20, TargetTag = "TeleportLibrary"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Gegner3", Range = 20, TargetTag = "TeleportLibrary"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Gegner4", Range = 20, TargetTag = "TeleportLibrary"},
			},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "TeleportLibrary", ObjectId = 1676, X = 482, Y = 480, Direction = 0},
			MapFlagSetFalse {Name = "mf_TeleportLibraryActive"},
		},
	},
	
	--Teleporter Avatar
	OnEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TeleportLibraryActive"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportLibrary", Range = 2},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam01"},
		},
		
	},
	
	OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam01", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam01"},
   		},
    },
	
	
	--Teleport aus der Bibliothek heraus
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Mordecay"},
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_ActivateTeleport"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_teleport_light", X = 599, Y = 20, Z = 539, MaxRange = 15, FallOffRange = 5},
			ObjectChange	{Tag = "TeleportOutLibrary", ObjectId = 1432, X = 599.229, Y = 539.474, Direction = 0},
			
		},
	},
	
	--Teleporter Avatar
	OnEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ActivateTeleport"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportOutLibrary", Range = 2},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndmarkerLibrary"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
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