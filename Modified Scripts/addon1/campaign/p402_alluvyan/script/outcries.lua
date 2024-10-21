State
{	
	StateName = "INIT",	
	
	--General Irion, sobald beide Lager zerstört:
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			BuildingIsDead	{Tag = "HaupthausOrc1"},
			BuildingIsDead	{Tag = "HaupthausOrc1_1"},
			BuildingIsDead	{Tag = "HaupthausOrc2"},
			BuildingIsDead	{Tag = "HaupthausOrc2_1"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion01"},
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion02"},
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion03"},
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion04"},
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion05"},
		},
		
	},
	
	--Skjaldir nach der ersten Cutszene.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P402_StartIntroCS"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Skjaldir", TextTag = "Skjadir06"},
			FigureOutcry	{Tag = "Skjaldir", TextTag = "Skjadir07"},
		},
		
	},
	
	--Outcry nachdem der Avatar den Geheimgang betreten hat.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotSolved {Quest = "Alluvyan_ToSevenkeeps"},	
			MapFlagIsTrue {Name = "mf_OutcryStartAvatar"},	
			MapFlagIsFalse {Name = "mf_EndSideQuests"},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
			MapFlagSetTrue {Name = "mf_GateOpenOutcry1"},	
		},
		
	},
		
--	--Outcry nach der Haldor Cutszene
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			QuestIsNotSolved {Quest = "Alluvyan_ToSevenkeeps"},	
--			MapFlagIsTrue {Name = "mf_EndInnerGate02CS"},
--			MapFlagIsFalse {Name = "mf_GateOpenOutcry1"},			
--		},
--		Actions =
--		{
--			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
--		},
--		
--	},
--	
	--Angriff auf die Haupthäuser
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotSolved {Quest = "Alluvyan_ToSevenkeeps"},	
			OR
			{
				BuildingHasNotHealth	{Tag = "Haupthaus01", Percent = 75},
				BuildingHasNotHealth	{Tag = "Haupthaus02", Percent = 75},
				BuildingHasNotHealth	{Tag = "Haupthaus03", Percent = 75},	
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
		},
		
	},
	
	--Angriff auf die Haupthäuser
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotSolved {Quest = "Alluvyan_ToSevenkeeps"},	
			OR
			{
				BuildingHasNotHealth	{Tag = "Haupthaus02", Percent = 90},
				BuildingHasNotHealth	{Tag = "Haupthaus03", Percent = 90},	
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion08"},
		},
		
	},
	--Angriff auf die Treants
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotSolved {Quest = "Alluvyan_ProtectTreants"},
			OR
			{
				FigureHasNotHealth	{Tag = "Treant01", Percent = 75},
				FigureHasNotHealth	{Tag = "Treant02", Percent = 75},
				FigureHasNotHealth	{Tag = "Treant03", Percent = 75},
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar04"},
		},
		
	},
	--Die Triboken beginnen auf die Katapulte zu schießen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartOutcryTrebuchet"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Observer", TextTag = "Observer09"},
		},
		
	},
	
	--Die Triboken beginnen auf die Katapulte zu schießen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartOutcryFlyingSupport"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Irion", TextTag = "General_Irion10"},
		},
		
	},
	
	
};
	