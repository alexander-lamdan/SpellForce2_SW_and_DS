
State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB01"},
				AvatarFlagIsTrue {Name = "af_P304_Cutscene04Start"},
			},
		},
		Actions =
		{	
		},
		-- Elfenbotschafterin spawnt erst am Turm, sobald die 4. Cutscene
		-- losgeht
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P304_CS_B_01_Respawn"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
			EntityFlagSetTrue {Name = "ef_respawn_please"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_respawn_only_once"},
			EntityFlagIsTrue {Name = "ef_respawn_please"},
		},
		DelayedActions = 
		{
			EntityFlagSetTrue {Name = "ef_respawn_only_once"},
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	};	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	},
	  
	  
	  OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_YliaFreed"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- EINSCHALTBEDINGUNG: Sobald Ylia frei ist (d.h. Hagards Summoned Servants killed)
	},    
 
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			AvatarValueIsGreaterOrEqual{Name = "av_P304_TalkWithYlia", Value = 1 },
 		},
 		Actions =
 		{
 			EntityFlagSetTrue{Name ="ef_DialogOff"},
 			EntityFlagSetTrue{Name = "ef_GoHome"},
 		},
 	},
 
 	OnIdleRunHomeFake
	{
		X = 182,
		Y = 435,
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_GoHome"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			EntityFlagSetFalse{Name ="ef_DialogOff"},
		},
	};


 
     OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithYlia", Value = 2 },
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- Nach dem zweiten Gespräch mit ihr wird sie abgeschaltet
	},    
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_YliaOnWestguardArrived"},
		},
		Actions =
		{
			FigureVanish{Tag = "default"},
		},
		-- Flag von Michael!
		-- sobald Ylia auf der Westguard angekommen ist, verschwindet sie auf der Golden Fields
	},
                                                                      
};                                                                         