State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		-- Wenn der Spieler das Lager zerstört hat geht der Dialog des Schroothaufens an und der Spieler kann eine Waffe bergen
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Enemy1", Amount = 1},
			OR
			{
				MapFlagIsTrue {Name = "mf_P407_TwoFirstCamp"},
				MapFlagIsTrue {Name = "mf_P407_ThreeFirstCamp"},
				MapFlagIsTrue {Name = "mf_P407_FourFirstCamp"},
			},
		},
		Actions =
		{
			ObjectChange {ObjectId = 2401},
			DialogTypeSetMainQuest {},
			DialogSetEnabled {Tag = "Junk1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Enemy1", Amount = 1},
			MapFlagIsFalse {Name = "mf_P407_TwoFirstCamp"},
			MapFlagIsFalse {Name = "mf_P407_ThreeFirstCamp"},
			MapFlagIsFalse {Name = "mf_P407_FourFirstCamp"},
		},
		Actions =
		{
			AvatarItemMiscGive {ItemId = 278, Amount = 1},
			MapFlagSetTrue {Name = "mf_P407_OneFirstCamp"},
			ObjectChange {ObjectId = 2462},
			MapFlagSetTrue {Name = "mf_P407_VanishJunk1"},
			EntityFlagSetTrue {Name = "ef_P407_Away"},

		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndWeaponCS"},
			EntityFlagIsTrue {Name = "ef_P407_Away"},
		},
		Actions =
		{
			ObjectVanish {},
		},
	}
}