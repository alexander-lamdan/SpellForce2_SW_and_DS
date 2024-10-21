--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    TeleportFight	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	
	
--	Teleporter
--*******************************************************
--***                                                 ***
--***               Room 36 --> Room 36A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker36"},
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

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker36", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker36"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 36A --> Room 36     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter36"},
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

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker36A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter36"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 0},
   		},
    },


--*******************************************************
--***                                                 ***
--***               Room 37 --> Room 37A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam03"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam03", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam03"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker37", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker37"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 37A --> Room 37     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam04"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam04", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam04"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker37A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter37"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 0},
   		},
    },

--*******************************************************
--***                                                 ***
--***               Room 41 --> Room 41A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam05"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam05", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam05"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker41", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker41"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 41A --> Room 41     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam06"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam06", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam06"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 0},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker41A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter41"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 0},
   		},
    },

--*******************************************************
--***                                                 ***
--***               Room 40 --> Room 40A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam07"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam07", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam07"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker40", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker40"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 40A --> Room 40     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 270},
    		EntityTimerStart	{Name = "et_AvatarFollowCam08"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam08", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam08"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker40A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter40"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 270},
   		},
    },

--*******************************************************
--***                                                 ***
--***               Room 39 --> Room 39A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam09"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam09", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam09"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker39", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker39"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 39A --> Room 39     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 270},
    		EntityTimerStart	{Name = "et_AvatarFollowCam10"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam10", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam10"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker39A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter39"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 270},
   		},
    },
	
--*******************************************************
--***                                                 ***
--***               Room 38 --> Room 38A     		  ***
--***                                                 ***
--*******************************************************
	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
    		EntityTimerStart	{Name = "et_AvatarFollowCam11"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam11", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam11"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 180},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker38", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportEndMarker38"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 180},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***               Room 38A --> Room 38     		  ***
--***                                                 ***
--*******************************************************

OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 270},
    		EntityTimerStart	{Name = "et_AvatarFollowCam12"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam12", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam12"},
   		},
    },

 	OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 270},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "TeleportMarker38A", Range = 2},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "RoomEndTeleporter38"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 270},
   		},
    },

--*******************************************************
--***                                                 ***
--***            Endteleport zur Formerin     		  ***
--***                                                 ***
--*******************************************************

	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 2, TargetTag = "teleporterRoom35"},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "AvatarEndTeleport"},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "MordecayEndTeleport"},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "NightSongEndTeleport"},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WhisperEndTeleport"},
 			EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWhisper", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WindEndTeleport"},
 			EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroWind", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "CaineEndTeleport"},
 			EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 270},
 			FigureTeleportToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "YashaEndTeleport"},
 			EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroYasha", Direction = 270},
    		EntityTimerStart	{Name = "et_AvatarFollowCam13"},
   		},
    },
	
	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam13", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam13"},
 			 MapFlagSetTrue {Name = "mf_TeleportPartyFinished"},
   		},
    },
	
	
};