-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
		},
		GotoState = "QuestState01"
	},
}


State
{
	StateName = "QuestState01",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PortalDisable{Tag = "WayToCrater"},
			PortalDisable{Tag = "WayToGF"},
			PortalDisable{Tag = "WayToDraghLur"},
			PlayerTravelDisable{},
			
			MapFlagSetTrue{Name = "mf_EnteredMap"},
			-- XP für Betreten der Map
			
			QuestSetActive {Quest = "FreeOrcsInFortress"},
		}, 
		-- Spieler bekommt Quest "Befreie die Orks"
		GotoState = "QuestState02"
	},
}


State
{
	StateName = "QuestState02",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_OrcCampFreed"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FreeOrcsInFortress"},
			QuestSetActive {Quest = "TalkToKeeper"},
		}, -- Hat man die Orcs befreit
		-- dann erhält man Quest "Sprich mit Keeper"
		GotoState = "QuestState03"
	},
	
}


State
{
	StateName = "QuestState03",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_TalkedWithSorok"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "TalkToKeeper"},
		}, -- Wenn man bei Sorok eine Entscheidung getroffen hat
		-- gehts weiter in State04 und dort dann je nach Entscheidung
		GotoState = "QuestState04"
	},
}



State
{
	StateName = "QuestState04",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_KillShygalla"}, 
		},
		Actions =
		{
			QuestSetActive {Quest = "KeeperMustLive"},
			QuestSetActive {Quest = "SummonShygallaAndKillHer"},
		}, 
		GotoState = "QuestState05Shygalla"
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_SoulSacrifice"},
		},
		Actions =
		{
			QuestSetActive {Quest = "KeeperMustLive"},
			QuestSetActive {Quest = "GetVictimsForSpiders"},
		}, 
		GotoState = "QuestState05SoulSacrificer"
	},
}

-- AB HIER: SHYGALLA-QUEST

State
{
	StateName = "QuestState05Shygalla",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_SorokMissionFulfilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "KeeperMustLive"},
			QuestSetSolved {Quest = "SummonShygallaAndKillHer"},
		},
		GotoState = "QuestState06" 
	}, -- sobald Shygalla getötet wurde, werden die 
	-- beiden gegabelten Alternativen wieder zusammengeführt
}



-- AB HIER: SOULSACRIFER-QUEST

State
{
	StateName = "QuestState05SoulSacrificer",

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetVictimsForSpiders"},
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetVictimsForSpiders"},
			QuestSetActive {Quest = "SacrificeVictims"},
		},
	}, -- sobald Sorok die Seelen abgeholt hab
	-- Quest "Opfere die Seelen"
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_SorokMissionFulfilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "SacrificeVictims"},
			QuestSetSolved {Quest = "KeeperMustLive"},
		},
		GotoState = "QuestState06" 
	}, -- sobald Seelen geopfert
	-- wieder zurück in den Mainpfad
}


State
{
	StateName = "QuestState06",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetActive {Quest = "DestroyRealmOutpost"},
		},
		GotoState = "QuestState07" 
	}, 
}

State
{
	StateName = "QuestState07",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_EndHQKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DestroyRealmOutpost"},
			QuestSetActive {Quest = "OnToDraghLur"},
			
			PortalEnable{Tag = "WayToCrater"},
			
			--PortalEnable{Tag = "WayToGF"},
			--Portal zur GF soll nie mehr freigeschaltet werden (bug 28206) 
			
			PortalEnable{Tag = "WayToDraghLur"},
			PlayerTravelEnable{},
			
			--ObjectSpawn	{ObjectId = 1641, X = 89.5651, Y = 399.014, Direction = 314.163, Tag = "Empty001"},
			--ObjectSpawn	{ObjectId = 1641, X = 604.426, Y = 597.789, Direction = 272.809, Tag = "Empty002"},
			--ObjectSpawn	{ObjectId = 1641, X = 536.439, Y = 565.927, Direction = 258.581, Tag = "Empty003"},
		},
	}, 
}