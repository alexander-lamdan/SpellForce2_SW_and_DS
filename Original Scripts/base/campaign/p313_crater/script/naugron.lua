delay = 30

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
			
		},
		GotoState = "Main",
	},
}
	

State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P313_NaugronAttacksNow"},
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks01",
	},
}


State
{
	StateName = "NaugronAttacks01",
	
	-- Sobald Spieler im inneren Krater:
	-- LOOP:
	-- Naugron setzt Timer
	-- Wenn Timer = 25, starte Effekt auf Avatar (sowie alle Helden), setze MapFlag = true
	-- Sobald Timer = 30, stoppe Effekt, setze MapFlag = false
	-- Restarte LOOP
	
	OnEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityTimerStart{Name = "et_Loop"},
			MapFlagSetTrue{Name = "mf_SpawnNaugronServants"},
		},
		GotoState = "NaugronAttacksA1",
	},
}

State
{
	StateName = "NaugronAttacksA1",
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 2},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_SpawnNaugronServants"},
		},
		-- Während dieser 5 Sekunden spawnen / respawnen Naugrons Diener
		GotoState = "NaugronAttacks02",
	},
}

State
{
	StateName = "NaugronAttacks02",
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 10},
			AvatarValueIsNotEqual{Name = "av_P313_NaugronBuildsSmashed", Value = 4},
		},
		Actions = 
		{
			EntityValueRandomize{Name = "ev_NextTarget", MinValue = 1, MaxValue = 10},
			EntityValueRandomize{Name = "ev_NextTarget", MinValue = 1, MaxValue = 10},
			EntityValueRandomize{Name = "ev_NextTarget", MinValue = 1, MaxValue = 10},
		},	
		GotoState = "NaugronAttacks03",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P313_NaugronBuildsSmashed", Value = 4},
		},
		Actions =
		{
		},
		GotoState = "BuildingFightFinishNaurgonGetsAggro",
	},
}

State
{
	StateName = "NaugronAttacks03",

	OnEvent
	{
		Conditions = 
		{
			OR
			{
				EntityValueIsEqual{Name = "ev_NextTarget", Value = 1},
				EntityValueIsGreater{Name = "ev_NextTarget", Value = 6},
			}
		},
		Actions = 
		{
			EntityValueSet{Name = "ev_NextTarget", Value = 1},
		},
		GotoState = "NaugronAttacks04AvatarCheck",	
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_NextTarget", Value = 2},	
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks04BorCheck",	
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_NextTarget", Value = 3},	
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks04JaredCheck",	
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_NextTarget", Value = 4},	
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks04LyaCheck",	
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_NextTarget", Value = 5},	
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks04MordecayCheck",	
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_NextTarget", Value = 6},	
		},
		Actions = 
		{
		},
		GotoState = "NaugronAttacks04ShaeCheck",	
	},
	
}	

State
{
	StateName = "NaugronAttacks04AvatarCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanAvatar"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04AvatarHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanAvatar"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04AvatarHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 1},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04AvatarDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04AvatarDrop",
	
	
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 25 },
			EffectStop{Tag = "pl_HumanAvatar"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}

State
{
	StateName = "NaugronAttacks04BorCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanHeroBor"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04BorHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanHeroBor"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04BorHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 2},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04BorDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04BorDrop",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanHeroBor", Percent = 25 },
			EffectStop{Tag = "pl_HumanHeroBor"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}

State
{
	StateName = "NaugronAttacks04JaredCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanHeroJared"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04JaredHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanHeroJared"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04JaredHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 3},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04JaredDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04JaredDrop",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanHeroJared", Percent = 25 },
			EffectStop{Tag = "pl_HumanHeroJared"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}


State
{
	StateName = "NaugronAttacks04LyaCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanHeroLya"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04LyaHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanHeroLya"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04LyaHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 4},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04LyaDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04LyaDrop",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanHeroLya", Percent = 25 },
			EffectStop{Tag = "pl_HumanHeroLya"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}


State
{
	StateName = "NaugronAttacks04MordecayCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanHeroMordecay"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04MordecayHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanHeroMordecay"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04MordecayHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 5},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04MordecayDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04MordecayDrop",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 25 },
			EffectStop{Tag = "pl_HumanHeroMordecay"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}


State
{
	StateName = "NaugronAttacks04ShaeCheck",
	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive{Tag = "pl_HumanHeroShae"},	
		},
		Actions = {},
		GotoState = "NaugronAttacks04ShaeHit",	
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "pl_HumanHeroShae"},
		},
		Actions = {},
		GotoState = "NaugronAttacks02",	
	},
}
State
{
	StateName = "NaugronAttacks04ShaeHit",
	OnEvent
	{
		Conditions = {},
		Actions =
		{
			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_Misc_HeroTarget"},
			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_Misc_BoneRain"},
			EffectStart	{Tag = "Naugron", File = "Effect_Misc_BoneCast"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 6},
			MapFlagSetTrue{Name = "mf_BoneRain"},
			MapTimerStart{Name = "mt_BoneRainDelay"},
		},
		GotoState = "NaugronAttacks04ShaeDrop",	
	},
}
State
{
	StateName = "NaugronAttacks04ShaeDrop",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_Loop", Seconds = 16},
		},
		Actions =
		{
			FigureHealthSubtract{Tag = "pl_HumanHeroShae", Percent = 25 },
			EffectStop{Tag = "pl_HumanHeroShae"},
			EffectStop{Tag = "Naugron"},
			MapValueSet {Name = "mv_BoneRainTarget", Value = 0},
			MapFlagSetFalse{Name = "mf_BoneRain"},
		},
		GotoState = "NaugronAttacks01",
	},
}
			
			


State
{
	StateName = "BuildingFightFinishNaurgonGetsAggro",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureTeamTransfer{Team = "tm_Team2"},
		},	
	},
}