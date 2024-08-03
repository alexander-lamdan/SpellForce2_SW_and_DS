KnightGreen = 0
KnightPurple = 1
KnightGold = 0
DragonGreen = 1
DragonPurple = 0
DragonGold = 1
KingGreen = 0
KingPurple = 1
KingGold = 1
Fool = 0

Reward = 4
-- Grüner Drache

OutcryTag = "MahJongWarningMale"
-- Outcry-Tag
-- falls male, dann OutcryTag = "MahJongWarningMale"
-- falls female, dann OutcryTag = "MahJongWarningFemale"



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


	
}
