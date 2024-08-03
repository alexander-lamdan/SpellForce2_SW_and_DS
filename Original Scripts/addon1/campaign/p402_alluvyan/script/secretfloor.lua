--*******************************************************
--***                                                 ***
--***               SecretFloor		                  ***
--***                                                 ***
--*******************************************************



State
{	
	StateName = "INIT",
	
	--Die Bretter die den Geheimgang abdecken werden entfernt sobald der Spieler die Map vom Baumeister erhalten hat und den Hebel betätigt
		
	
	OnOneTimeLeverEvent
	{
		Lever = "LeverSecret",
		OnConditions = 
		{
			--AvatarHasItemMisc	{Player = "pl_Human", ItemId = 305, Amount = 1},
			MapFlagIsTrue {Name = "mf_MapGiven"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "LeverSecret", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 334.8, Y = 430.5},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "Grid01"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_grate_open", X = 329, Y = 17, Z = 438, MaxRange = 30, FallOffRange = 5},
			GateSetOpen	{Tag = "Grid02"},
			--AvatarItemMiscTake	{Player = "pl_Human", ItemId = 305, Amount = 1},
			MapFlagSetTrue {Name = "mf_TeleportStart"},
			ObjectSpawn	{ObjectId = 1432, X = 330.4, Y = 443.35 , Direction = 0, Tag = "TeleportStart"},
			ObjectSpawn	{ObjectId = 1432, X = 278.5, Y = 481.8 , Direction = 0, Tag = "TeleportEnd"},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 305, Amount = 1},
		},
		
	},
	
	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_TeleportStart"},
    	},
    	Actions =
    	{

   		},
		GotoState = "SecretDoorOpen",   
    },
   
    
};

--*******************************************************
--***                                                 ***
--***     			  SecretDoorOpen 		   		  ***
--***                                                 ***
--*******************************************************

State
{	
	StateName = "SecretDoorOpen",
	--Avatar betritt den Teleporter, Stadt --> InnerenStadt
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 330.4, Y = 443.35},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 288, Y = 481.6},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 90},
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
 			 MapFlagSetTrue {Name = "mf_OutcryStartAvatar"},
 			 ObjectSpawn	{ObjectId = 1591, X = 339.108, Y = 471.564,  Direction = 0, Tag = "LeverSecret2"},
   		},
    },
    
   	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_OutcryStartAvatar"},
    	},
    	Actions =
    	{
 			QuestSetSolved {Quest = "Alluvyan_SearchOutOfTown"},
   		},
    },
    
    --Avatar betritt den Teleporter, InnerenStadt --> Stadt
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 278.5, Y = 481.8},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 330.4, Y = 434.35},
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
