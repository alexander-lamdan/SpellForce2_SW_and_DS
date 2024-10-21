KnightGreen = 2
KnightPurple = 2
KnightGold = 2
DragonGreen = 2
DragonPurple = 2
DragonGold = 2
KingGreen = 2
KingPurple = 2
KingGold = 2
Fool = 3

Reward = 10
-- Narr

OutcryTag = "MahJongWarningCarla"
-- Outcry-Tag
-- falls male, dann OutcryTag = "MahJongWarningMale"
-- falls female, dann OutcryTag = "MahJongWarningFemale"
-- falls Carla, dann OutcryTag = "MahJongWarningCarla"



State
{
	StateName = "MainState",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityValueSet{Name = "ev_NPCHasGreenKnight", Value = KnightGreen },
			EntityValueSet{Name = "ev_NPCHasPurpleKnight", Value = KnightPurple },
			EntityValueSet{Name = "ev_NPCHasGoldKnight", Value = KnightGold },
			EntityValueSet{Name = "ev_NPCHasGreenDragon", Value = DragonGreen },
			EntityValueSet{Name = "ev_NPCHasPurpleDragon", Value = DragonPurple },
			EntityValueSet{Name = "ev_NPCHasGoldDragon", Value = DragonGold },
			EntityValueSet{Name = "ev_NPCHasGreenKing", Value = KingGreen },
			EntityValueSet{Name = "ev_NPCHasPurpleKing", Value = KingPurple },
			EntityValueSet{Name = "ev_NPCHasGoldKing", Value = KingGold },
			EntityValueSet{Name = "ev_NPCHasFool", Value = Fool },
			
			EntityValueSet{Name = "ev_RewardStone", Value = Reward},
		-- Am Anfang bekommt der Opponent seine Karten
		},
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetDisabled{},
		},
		-- startet disabled
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DrakkarGameStart"},
		},
		Actions =
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Won"},
		},
		Actions =
		{
			DialogSetDisabled{},
		},
		-- sobald gewonnen, wird Dialog entfernt
	},
	
	OnToggleEvent
	{
		OnConditions = 
		{
			EntityFlagIsTrue{Name = "ef_MahJongBattleOn"},
			AvatarIsNotTalking{},
			GameInterfaceIsVisible{},
		},
		OnActions = 
		{
			FigureOutcry{TextTag = OutcryTag, Tag = "default"},
		},
		OffConditions = 
		{
			EntityFlagIsFalse{Name = "ef_MahJongBattleOn"},
		},
		OffActions = 
		{
		},
	};


	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 129, Amount = 1},
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 137, Amount = 1},
				-- wenn Spieler kleine oder groﬂe Taschendiebstahlklaue hat
			},
			FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 3},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 147, Amount = 1 },
			FigureOutcry{TextTag = "Pickpocketing01", Tag = "pl_HumanAvatar"},
			-- GR‹NER K÷NIG ABGREIFEN
		},
	},
	
}
