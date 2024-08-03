--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    NecromantFight2	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
			PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
			OR
			{
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard1"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard2"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard3"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard4"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard5"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "NecroGuard6"},
				PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 8, TargetTag = "Necromancer"},
			},
		},
		Actions =
		{
				MapTimerStart	{Name = "mt_HeroTeleportNecroTimer"},
				EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
				--DebugMessage	{Caption = "Necromancer", Message = "TimerStart"},
				MapFlagSetTrue {Name = "mf_NecroFightStart"},
		},
		
	},
	
	OnEvent
	{
		Conditions =
		{
				MapTimerIsElapsed	{Name = "mt_HeroTeleportNecroTimer", Seconds = 30},
				EntityFlagIsTrue	{Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
				MapTimerStop	{Name = "mt_HeroTeleportNecroTimer"},
				MapFlagSetTrue {Name = "mf_HeroTeleport"},
				EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
				--DebugMessage	{Caption = "Necromancer", Message = "TimerFinished"},
		},
		
	},

	OnEvent
	{
		Conditions =
		{
				PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
				MapFlagIsTrue {Name = "mf_HeroTeleport"},
				FigureIsNotInRange	{Tag = "pl_HumanHeroYasha", Range = 3, X = 128, Y = 105},
				FigureIsAlive	{Tag = "pl_HumanHeroYasha"},
		},
		Actions =
		{
				FigureTeleport	{Tag = "pl_HumanHeroYasha", X = 128, Y = 105},
				EffectStart	{Tag = "pl_HumanHeroYasha", File = "Effect_DeSpawn_Unit"},
				MapFlagSetFalse {Name = "mf_HeroTeleport"},
				--DebugMessage	{Caption = "Necromancer", Message = "HeroNr.1"},
		},
		
	},
	
	OnEvent
	{
		Conditions =
		{
				PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
				MapFlagIsTrue {Name = "mf_HeroTeleport"},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroYasha", Range = 5, X = 128, Y = 105},
					FigureIsDead	{Tag = "pl_HumanHeroYasha"},
				},
				FigureIsNotInRange	{Tag = "pl_HumanHeroWhisper", Range = 3, X = 151, Y = 103},
				FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
		},
		Actions =
		{
				FigureTeleport	{Tag = "pl_HumanHeroWhisper", X = 151, Y = 103},
				EffectStart	{Tag = "pl_HumanHeroWhisper", File = "Effect_DeSpawn_Unit"},
				MapFlagSetFalse {Name = "mf_HeroTeleport"},
		},
		
	},

	OnEvent
	{
		Conditions =
		{
				PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
				MapFlagIsTrue {Name = "mf_HeroTeleport"},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroYasha", Range = 5, X = 128, Y = 105},
					FigureIsDead	{Tag = "pl_HumanHeroYasha"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 3, X = 151, Y = 103},
					FigureIsDead	{Tag = "pl_HumanHeroWhisper"},
				},
				FigureIsNotInRange	{Tag = "pl_HumanHeroWind", Range = 3, X = 114, Y = 75},
				FigureIsAlive	{Tag = "pl_HumanHeroWind"},
		},
		Actions =
		{
				FigureTeleport	{Tag = "pl_HumanHeroWind", X = 114, Y = 75},
				EffectStart	{Tag = "pl_HumanHeroWind", File = "Effect_DeSpawn_Unit"},
				MapFlagSetFalse {Name = "mf_HeroTeleport"},
		},
		
	},
	
	OnEvent
	{
		Conditions =
		{
				PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
				MapFlagIsTrue {Name = "mf_HeroTeleport"},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroYasha", Range = 5, X = 128, Y = 105},
					FigureIsDead	{Tag = "pl_HumanHeroYasha"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 3, X = 151, Y = 103},
					FigureIsDead	{Tag = "pl_HumanHeroWhisper"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroWind", Range = 3, X = 114, Y = 75},
					FigureIsDead	{Tag = "pl_HumanHeroWind"},
				},
				
				FigureIsNotInRange	{Tag = "pl_HumanHeroCaine", Range = 3, X = 138, Y = 75},
				FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
		},
		Actions =
		{
				FigureTeleport	{Tag = "pl_HumanHeroCaine", X = 138, Y = 75},
				EffectStart	{Tag = "pl_HumanHeroCaine", File = "Effect_DeSpawn_Unit"},
				MapFlagSetFalse {Name = "mf_HeroTeleport"},
		},
		
	},
	
	OnEvent
	{
		Conditions =
		{
				PlayerHasUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
				MapFlagIsTrue {Name = "mf_HeroTeleport"},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroYasha", Range = 5, X = 128, Y = 105},
					FigureIsDead	{Tag = "pl_HumanHeroYasha"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 3, X = 151, Y = 103},
					FigureIsDead	{Tag = "pl_HumanHeroWhisper"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroWind", Range = 3, X = 114, Y = 75},
					FigureIsDead	{Tag = "pl_HumanHeroWind"},
				},
				OR
				{
					FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 3, X = 138, Y = 75},
					FigureIsDead	{Tag = "pl_HumanHeroCaine"},
				},
			
				FigureIsNotInRange	{Tag = "pl_HumanHeroMordecay", Range = 3, X = 149, Y = 75},
				FigureIsAlive	{Tag = "pl_HumanHeroMordecay"},
				
		},
		Actions =
		{
				FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 149, Y = 75},
				EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
				MapFlagSetFalse {Name = "mf_HeroTeleport"},
		},
		
	},


};

