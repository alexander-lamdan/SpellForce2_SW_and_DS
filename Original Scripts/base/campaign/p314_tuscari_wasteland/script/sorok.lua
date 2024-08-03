
SoulReservoirX = 603
SoulReservoirY = 196
-- Hier stehen die Lichtbeter zu Beginn

SoulCave01X = 367
SoulCave01Y = 423
SoulCave02X = 303
SoulCave02Y = 350
SoulCave03X = 303
SoulCave03Y = 214
SoulCave04X = 336
SoulCave04Y = 481
SoulCave05X = 390
SoulCave05Y = 573
SoulCave06X = 443
SoulCave06Y = 524
-- Die Koordinaten der sechs Soul-Sacrificer-Hoehlen






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
			-- zu Beginn der Karte kriegt er Dialog abgenommen
			EntityFlagSetTrue {Name ="ef_DialogOff"},
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
	};

    
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P314_CS02Finished"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
	}, -- sobald OrcCamp befreit, schaltet er Dialog an
    
    
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_TalkedWithSorok"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
			DialogSetDisabled{},
		},
	}, -- sobald eine Entscheidung im Gespräch getroffen wurde,
	-- wird Sorok wieder abgeschaltet    
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_KillShygalla"}, 
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Sorok", Team = "tm_Team1"},
		},
		GotoState = "Shygalla"
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_SoulSacrifice"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Sorok", Team = "tm_Team1"},
		},
		GotoState = "SoulSacrificer"
	},
}   



State
{
	StateName = "Shygalla",

	OnIdleGoHomeFake
	{
		X = 435,
		Y = 478,
		Conditions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry{TextTag = "Sorok09"},
			AvatarFlagSetTrue{Name = "af_P314_ShygallaAppear"},
			FigureOutcry{TextTag = "Sorok10"},
			
			FogOfWarReveal	{X = 435, Y = 478, Range = 30, Height = default},
		},
	}, -- Sorok geht zur Beschwörungsstelle von Shygalla
	
}     


State
{
	StateName = "SoulSacrificer",

	OnIdleGoHomeFake
	{
		X = SoulReservoirX,
		Y = SoulReservoirY,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 0},
		},
		Actions =
		{
			FogOfWarReveal{FogOfWarId = 33, X = SoulReservoirX, Y = SoulReservoirY, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			GateSetOpen	{Tag = "LichtbeterGate01"},
			FigureOutcry{TextTag = "Sorok01", Tag = "Sorok"},
			FigureOutcry{TextTag = "Sorok02", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 1},
		},
	}, -- Sorok geht zum Platz der Lichtbeter

	OnIdleGoHomeFake
	{
		X = SoulCave01X,
		Y = SoulCave01Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 1},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 33},
			
			FogOfWarReveal{FogOfWarId = 34, X = SoulCave01X, Y = SoulCave01Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 1},
		},
	}, -- Sorok geht zur 1. Höhle
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 1},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 1},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 1},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok03", Tag = "Sorok"},
			FigureOutcry{TextTag = "Sorok04", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 2},
		},
	},
	
	OnIdleGoHomeFake
	{
		X = SoulCave02X,
		Y = SoulCave02Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 2},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 34},
			
			FogOfWarReveal{FogOfWarId = 35, X = SoulCave02X, Y = SoulCave02Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 2},
		},
	}, -- Sorok geht zur 2. Höhle
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 2},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 2},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 2},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok03", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 3},
		},
	},
	
	OnIdleGoHomeFake
	{
		X = SoulCave03X,
		Y = SoulCave03Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 3},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 35},
			
			FogOfWarReveal{FogOfWarId = 36, X = SoulCave03X, Y = SoulCave03Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 3},
		},
	}, -- Sorok geht zur 3. Höhle
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 3},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 3},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 3},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok03", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 4},
		},
	},
	
	
	OnIdleGoHomeFake
	{
		X = SoulCave04X,
		Y = SoulCave04Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 4},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 36},
			
			FogOfWarReveal{FogOfWarId = 37, X = SoulCave04X, Y = SoulCave04Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 4},
		},
	}, -- Sorok geht zur 4. Höhle
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 4},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 4},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 4},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok03", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 5},
		},
	},
	
	OnIdleGoHomeFake
	{
		X = SoulCave05X,
		Y = SoulCave05Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 5},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 37},
			
			FogOfWarReveal{FogOfWarId = 38, X = SoulCave05X, Y = SoulCave05Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 5},
		},
	}, -- Sorok geht zur 5. Höhle
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 5},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 5},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 5},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok05", Tag = "Sorok"},
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 6},
		},
	},
	
	OnIdleGoHomeFake
	{
		X = SoulCave06X,
		Y = SoulCave06Y,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 6},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 39},
			
			FogOfWarReveal{FogOfWarId = 40, X = SoulCave06X, Y = SoulCave06Y, Range = 30, Height = default},
		},
		OneTimeHomeActions = 
		{
			AvatarValueSet{Name = "av_P314_SorokReachedPoint", Value = 6},
		},
	}, -- Sorok geht zur letzten Höhle, Opferung vollendet
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 6},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 6},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 6},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Sorok06", Tag = "Sorok"},
			FigureOutcry{TextTag = "Sorok07", Tag = "Sorok"},
			FigureOutcry{TextTag = "Sorok08", Tag = "Sorok"},
			EntityTimerStart{Name = "et_WaitOutcryTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 6},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = 6},
			AvatarValueIsEqual{Name = "av_P314_LichtbetersSacrificed", Value = 6},
			EntityTimerIsElapsed{Name = "et_WaitOutcryTimer", Seconds = 15},
		},
		Actions =
		{
			FogOfWarCloak{FogOfWarId = 40},
			
			AvatarValueSet{Name = "av_P314_SoroksSoulRun", Value = 7},
		},
	},
	
}
