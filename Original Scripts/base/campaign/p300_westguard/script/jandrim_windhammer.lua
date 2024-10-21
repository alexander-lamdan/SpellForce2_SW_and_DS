

State
{
	StateName = "WindhammerState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P305_JandrimSpawnOnWestguard"},	
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WindhammerAlive"},
			AvatarFlagSetTrue{Name = "af_P300_UnderHallQuestSolved"},
    		DialogTypeSetSideQuest	{Tag = "Jandrim_Windhammer"},
			DialogSetEnabled	{Tag = "Jandrim_Windhammer"},
			FogOfWarReveal	{X = 410, Y = 313, Range = 10, Height = 140},
			FigureSwappingDisable {},
			--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 201, Amount = 1},
			--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 202, Amount = 1},
			--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 203, Amount = 1},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimDialogEnd"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 18, X = 408.6, Y = 318, Direction = 0, Tag = "JandrimTreasure"},
			ObjectLootItemEquipmentAdd	{Tag = "JandrimTreasure", DropChance = 100, ItemId = 401},
			ObjectLootItemEquipmentAdd	{Tag = "JandrimTreasure", DropChance = 100, ItemId = 510},
			
		},
		
	},
--*******************************************************
--***                                                 ***
--***          Jandrims Schmiedekunst NQ              ***
--***                                                 ***
--*******************************************************


--DialogJandrim wird enabled und disabled je nach Queststand
	OnEvent
	{
		EventName = "JandrimDialogEnable",
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimDialogEnd"},
			MapFlagIsFalse {Name = "mf_JandrimDialogOn"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			OR
			{
				AvatarHasItemMisc	{ItemId = 201, Amount = 1},
				AvatarHasItemMisc	{ItemId = 202, Amount = 1},
				AvatarHasItemMisc	{ItemId = 203, Amount = 1},
				QuestIsActive	{Quest = "WestguardJandrimsRecipes1"},
				QuestIsActive	{Quest = "WestguardJandrimsRecipes2"},
				QuestIsActive	{Quest = "WestguardJandrimsRecipes3"},
			},
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "Jandrim_Windhammer"},
			DialogSetEnabled	{Tag = "Jandrim_Windhammer"},
			MapFlagSetTrue {Name = "mf_JandrimDialogOn"},
		},
		
	},
	
	OnEvent
	{
		EventName = "JandrimDialogDisable",
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimDialogEnd"},
			MapFlagIsTrue {Name = "mf_JandrimDialogOn"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			AvatarHasNotItemMisc	{ItemId = 201, Amount = 1},
			AvatarHasNotItemMisc	{ItemId = 202, Amount = 1},
			AvatarHasNotItemMisc	{ItemId = 203, Amount = 1},
			QuestIsNotActive	{Quest = "WestguardJandrimsRecipes1"},
			QuestIsNotActive	{Quest = "WestguardJandrimsRecipes2"},
			QuestIsNotActive	{Quest = "WestguardJandrimsRecipes3"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Jandrim_Windhammer"},
			MapFlagSetFalse {Name = "mf_JandrimDialogOn"},
		},
		
	},



--Rezept Lichtfaust gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 201, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim_Windhammer", Range = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			QuestSetActive	{Quest = "WestguardJandrimsRecipes1"},
			QuestSetActive	{Quest = "Recipe1GetCrystals"},
		
		},
		
	},
	--Materialien gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 162, Amount = 8},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe1GetCrystals"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe1GetCrystals"},
			QuestSetActive	{Quest = "Recipe1BringStuffToJandrim"},
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsAReady"},
		},
		
	},
	
	
	--NQ Belohnung für das Beschaffen der Materialien
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimsReward"},
			AvatarFlagIsTrue{Name = "af_P300_JandrimsItemsAReady"},
		},
		Actions =
		{
			AvatarItemEquipmentGive	{ItemId = 505, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsReward"},
			AvatarItemMiscTake	{ItemId = 162, Amount = 8},
			AvatarItemMiscTake	{ItemId = 201, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsRecipeAReady"},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsItemsAReady"},
			QuestSetSolved	{Quest = "WestguardJandrimsRecipes1"},
			QuestSetSolved	{Quest = "Recipe1BringStuffToJandrim"},
		},
		
	},
	--Rezept Gedanke & Erinnerung gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 202, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim_Windhammer", Range = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			QuestSetActive	{Quest = "WestguardJandrimsRecipes2"},
			QuestSetActive	{Quest = "Recipe2Whisperstone"},
			QuestSetActive	{Quest = "Recipe2VulcansteelHilts"},
			QuestSetActive	{Quest = "Recipe2PerfectBeastHide"},
			QuestSetActive	{Quest = "Recipe2GetSingingShard"},
			--AvatarFlagSetTrue{Name = "af_P300_JandrimsRecipeBReady"},
		},
		
	},
	--Materialie Flüsterstein dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 204, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe2Whisperstone"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2Whisperstone"},
		},
		
	},
	--Materialien Vulkangriffe dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 210, Amount = 2},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe2VulcansteelHilts"},			
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2VulcansteelHilts"},
		},
		
	},
	--Materialie Bestienhaut dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			AvatarHasItemMisc	{ItemId = 211, Amount = 1},
			QuestIsActive	{Quest = "Recipe2PerfectBeastHide"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2PerfectBeastHide"},
		},
		
	},
	--Materialie Singende Kröte dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 212, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe2GetSingingShard"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2GetSingingShard"},
		},
		
	},
	--Materialien gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "Recipe2Whisperstone"},
			QuestIsSolved	{Quest = "Recipe2VulcansteelHilts"},
			QuestIsSolved	{Quest = "Recipe2PerfectBeastHide"},
			QuestIsSolved	{Quest = "Recipe2GetSingingShard"},
			AvatarFlagIsFalse{Name = "af_P300_JandrimsItemsBReady"},
			QuestIsNotKnown	{Quest = "Recipe2BringStuffToJandrim"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsBReady"},
			QuestSetActive	{Quest = "Recipe2BringStuffToJandrim"},
		},
		
	},
	--NQ Belohnung für das Beschaffen der Materialien
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimsReward"},
			AvatarFlagIsTrue{Name = "af_P300_JandrimsItemsBReady"},
		},
		Actions =
		{
			AvatarItemEquipmentGive	{ItemId = 541, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 592, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsReward"},
			AvatarItemMiscTake	{ItemId = 204, Amount = 1},
			AvatarItemMiscTake	{ItemId = 210, Amount = 2},
			AvatarItemMiscTake	{ItemId = 211, Amount = 1},
			AvatarItemMiscTake	{ItemId = 212, Amount = 1},
			AvatarItemMiscTake	{ItemId = 202, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsRecipeBReady"},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsItemsBReady"},
			QuestSetSolved	{Quest = "WestguardJandrimsRecipes2"},
			QuestSetSolved	{Quest = "Recipe2BringStuffToJandrim"},
		},
		
	},
	--Rezept Blutmond gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 203, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim_Windhammer", Range = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			
			QuestSetActive	{Quest = "WestguardJandrimsRecipes3"},
			QuestSetActive	{Quest = "Recipe3LivingRunes"},
			QuestSetActive	{Quest = "Recipe3TeartemperedBlade"},
			QuestSetActive	{Quest = "Recipe3Dragonskin"},
			
		},
		
	},
	--Materialie lebende Runen dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 205, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe3LivingRunes"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe3LivingRunes"},
		},
		
	},
	--Materialie tränenbesetzte Klinge dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 213, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe3TeartemperedBlade"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe3TeartemperedBlade"},
		},
		
	},
	--Materialie Drachenhaut dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 214, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe3Dragonskin"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe3Dragonskin"},
		},
		
	},
	--Materialie Drachenhaut dabei
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "Recipe3LivingRunes"},
			QuestIsSolved	{Quest = "Recipe3TeartemperedBlade"},
			QuestIsSolved	{Quest = "Recipe3Dragonskin"},
			AvatarFlagIsFalse{Name = "af_P300_JandrimsItemsCReady"},
			QuestIsNotKnown	{Quest = "Recipe3ReturnJandrim"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsCReady"},
			QuestSetActive	{Quest = "Recipe3ReturnJandrim"},
		},
		
	},
	
	
	--NQ Belohnung für das Beschaffen der Materialien
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_JandrimsReward"},
			AvatarFlagIsTrue{Name = "af_P300_JandrimsItemsCReady"},
		},
		Actions =
		{
			AvatarItemEquipmentGive	{ItemId = 636, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsReward"},
			AvatarItemMiscTake	{ItemId = 205, Amount = 1},
			AvatarItemMiscTake	{ItemId = 213, Amount = 1},
			AvatarItemMiscTake	{ItemId = 214, Amount = 1},
			AvatarItemMiscTake	{ItemId = 203, Amount = 1},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsRecipeCReady"},
			AvatarFlagSetFalse{Name = "af_P300_JandrimsItemsCReady"},
			QuestSetSolved	{Quest = "WestguardJandrimsRecipes3"},
			QuestSetSolved	{Quest = "Recipe3ReturnJandrim"},
			
		},
		
	},

	--Wenn der Spieler alle Schmiedearbeiten erhalten hat wird der Dialog mit Jandrim auf ewig verweigert :)
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "WestguardJandrimsRecipes1"},
			QuestIsSolved	{Quest = "WestguardJandrimsRecipes2"},
			QuestIsSolved	{Quest = "WestguardJandrimsRecipes3"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Jandrim_Windhammer"},
		},
		
	},
	
	
};
