

State
{
	StateName = "YliaState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_YliaAlive"},
			AvatarFlagSetTrue{Name = "af_P300_YliaAfterDunMora"},
    		DialogTypeSetSideQuest	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "Ylia" },
			ObjectVanish	{Tag = "Gitter2"},
			AvatarFlagSetTrue{Name = "af_P300_YliaOnWestguardArrived"},
			FogOfWarReveal	{X = 451.5, Y = 430.6, Range = 10, Height = 135},
			FigureSwappingDisable {Tag = "Ylia"},
			
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaBackStatue"},
			MapFlagIsFalse{Name = "mf_YliaBackBrunnen"},
			AvatarFlagIsTrue{Name = "af_P300_YliaDialogEnd"},
			FigureIsInRange	{Range = 5, X = GetEntityX(), Y = GetEntityY()},
		},
		Actions =
		{
			--Dialog von Ylia wird freigeschaltet
			DialogTypeSetSideQuest	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "Ylia" },
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P300_YliaDialogEnd"},
			MapFlagIsTrue {Name = "mf_BrunnenFertigGebaut"},
			MapFlagIsFalse {Name = "mf_YliaGoBrunen"},
			MapFlagIsFalse{Name = "mf_YliaGoDenkmal"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			--Dialog von Ylia wird freigeschaltet
			DialogTypeSetSideQuest	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "Ylia" },
		},
		
	},
	--Dialog Disabled	
	OnOneTimeEvent
	{
		Conditions =
		{
			
			AvatarFlagIsTrue{Name = "af_P300_YliaDialogEnd"},
			MapFlagIsFalse {Name = "mf_BrunnenFertigGebaut"},
			MapFlagIsFalse {Name = "mf_DenkmalFertigGebaut"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Ylia" },
			MapFlagSetTrue{Name = "mf_DisableFirstTime"},
		},
		
	},
			
	
	--Ylia segnet den Brunnen, nachdem sie dort angekommen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaGoBrunen"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			--FigureWalkToEntity	{TargetTag = "BrunnenWestguard"},
			EffectStartAtEntityPosition	{Tag = "Ylia", File = "Effect_Spawn_Unit"},
			EntityTimerStart	{Name = "et_YliaSpawnTimer"},
			
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaSpawnTimer", Seconds = 3},
		},
		Actions =
		{
			--FigureTeleportToEntity	{TargetTag = "BrunnenWestguard"},
			FigureTeleport	{Tag = "Ylia", X = 290, Y = 336},
			
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaGoBrunen"},
			FigureIsInEntityRange	{TargetTag = "BrunnenWestguard", Range = 8},
		},
		Actions =
		{
			EffectStop	{Tag = "Ylia"},
			EntityTimerStop	{Name = "et_YliaSpawnTimer"},
			EntityTimerStart	{Name = "et_YliaBrunnenTimer"},
		
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaBrunnenTimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_YliaSegnetBrunnenFinish"},
			EntityTimerStart	{Name = "et_YliaSpawnTimer"},
			
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaSpawnTimer", Seconds = 3},
		},
		Actions =
		{
			FigureTeleport	{X = GetEntityX(), Y = GetEntityY()},
			EffectStop	{Tag = "Ylia"},
			EntityTimerStop	{Name = "et_YliaSpawnTimer"},
			MapFlagSetTrue{Name = "mf_YliaBackBrunnen"},
		},
		
	},
	
	
	
--Ylia segnet das Denkmal, nachdem sie dort angekommen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaBackBrunnen"},
			MapFlagIsFalse{Name = "mf_YliaBackStatue"},
			AvatarFlagIsTrue{Name = "af_P300_YliaDialogEnd"},
			FigureIsInRange	{Range = 5, X = GetEntityX(), Y = GetEntityY()},
		},
		Actions =
		{
			--Dialog von Ylia wird freigeschaltet
			DialogTypeSetSideQuest	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "Ylia" },
		},
		
	},	


	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaGoDenkmal"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_YliaSpawnTimer2"},
			EffectStartAtEntityPosition	{Tag = "Ylia", File = "Effect_Spawn_Unit"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaSpawnTimer2", Seconds = 3},
		},
		Actions =
		{
			FigureTeleport	{Tag = "Ylia", X = 402, Y = 270},
		},
		
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_YliaGoDenkmal"},
			FigureIsInEntityRange	{TargetTag = "StatueWestguard", Range = 8},
		},
		Actions =
		{
			EffectStop	{Tag = "Ylia"},
			EntityTimerStop	{Name = "et_YliaSpawnTimer2"},
			EntityTimerStart	{Name = "et_YliaDenkmalTimer"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaDenkmalTimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_YliaSegnetDenkmalFinish"},
			EntityTimerStart	{Name = "et_YliaSpawnTimer2"},
			EffectStartAtEntityPosition	{Tag = "Ylia", File = "Effect_Spawn_Unit"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_YliaSpawnTimer2", Seconds = 3},
		},
		Actions =
		{
			FigureTeleport	{X = GetEntityX(), Y = GetEntityY()},
			EffectStop	{Tag = "Ylia"},
			EntityTimerStop	{Name = "et_YliaSpawnTimer2"},
			MapFlagSetTrue{Name = "mf_YliaBackStatue"},
		},
		
	},

	
};
