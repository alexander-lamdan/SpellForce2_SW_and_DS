State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		-- Wenn der Spieler das Lager zerstört hat geht der Dialog des Schroothaufens an und der Spieler kann eine Waffe bergen
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Enemy2", Amount = 1},
			OR
			{
				MapFlagIsTrue {Name = "mf_P407_OneFirstCamp"},
				MapFlagIsTrue {Name = "mf_P407_ThreeFirstCamp"},
				MapFlagIsTrue {Name = "mf_P407_FourFirstCamp"},
			},
		},
		Actions =
		{
			ObjectChange {ObjectId = 2401},
			DialogTypeSetMainQuest {},
			DialogSetEnabled {Tag = "Junk2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Enemy2", Amount = 1},
			MapFlagIsFalse {Name = "mf_P407_OneFirstCamp"},
			MapFlagIsFalse {Name = "mf_P407_ThreeFirstCamp"},
			MapFlagIsFalse {Name = "mf_P407_FourFirstCamp"},
		},
		Actions =
		{
			AvatarItemMiscGive {ItemId = 276, Amount = 1},
			MapFlagSetTrue {Name = "mf_P407_TwoFirstCamp"},
			ObjectChange {ObjectId = 2462},
			MapFlagSetTrue {Name = "mf_P407_VanishJunk2"},
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