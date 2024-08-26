
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
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	OnEvent
	{
		-- Zorngeistercombo
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_ZornGeisterGerufen"},
			OR
			{
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 3},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 2},
				},
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 2},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 3},
				},
			}
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			MapFlagSetTrue{Name = "mf_ZornGeisterGerufen"},
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
			FigureOutcryImmediate	{TextTag = "CallingGhosts02", Tag = "OutcryStorm"},
		},
	},
	OnEvent
	{
		-- Angstgeistercombo
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_AngstGeisterGerufen"},
			OR
			{
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 5},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 3},
				},
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 3},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 5},
				},
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			MapFlagSetTrue{Name = "mf_AngstGeisterGerufen"},
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
			FigureOutcryImmediate	{TextTag = "CallingGhosts04", Tag = "OutcryStorm"},
		},
	},
	OnEvent
	{
		-- Abscheugeistercombo
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_AbscheuGeisterGerufen"},
			OR
			{
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 4},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 1},
				},
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 1},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 4},
				},
			},
			
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			MapFlagSetTrue{Name = "mf_AbscheuGeisterGerufen"},
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
			FigureOutcryImmediate	{TextTag = "CallingGhosts05", Tag = "OutcryStorm"},
		},
	},
	OnEvent
	{
		-- Hassgeistercombo
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_HassGeisterGerufen"},
			OR
			{
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 2},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 4},
				},
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 4},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 2},
				},
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			MapFlagSetTrue{Name = "mf_HassGeisterGerufen"},
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
			FigureOutcryImmediate	{TextTag = "CallingGhosts03", Tag = "OutcryStorm"},
		},
	},
	OnEvent
	{
		-- Wahnsinngeistercombo
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_WahnsinnGeisterGerufen"},
			OR
			{
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 1},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 5},
				},
				AND
				{
					MapValueIsEqual{Name = "mv_OldSound", Value = 5},
					MapValueIsEqual{Name = "mv_ActualSound", Value = 1},
				},
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			MapFlagSetTrue{Name = "mf_WahnsinnGeisterGerufen"},
			MapValueSet{Name = "mv_OldSound", Value = 0},
			MapValueSet{Name = "mv_ActualSound", Value = 0},
			FigureOutcryImmediate	{TextTag = "CallingGhosts01", Tag = "OutcryStorm"},
		},
	},
	

}
