dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	-- Erst mal alle Gebäude übergeben
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PlayerBuildingAdd {BuildingId = 133},
			PlayerBuildingAdd {BuildingId = 134},
			PlayerBuildingAdd {BuildingId = 136},
			PlayerBuildingAdd {BuildingId = 137},
			PlayerBuildingAdd {BuildingId = 139},
			PlayerBuildingAdd {BuildingId = 140},
			PlayerBuildingAdd {BuildingId = 141},
			PlayerBuildingAdd {BuildingId = 142},
			PlayerBuildingAdd {BuildingId = 144},
			PlayerBuildingAdd {BuildingId = 145},
			PlayerBuildingAdd {BuildingId = 146},
			PlayerBuildingAdd {BuildingId = 147},
			PlayerBuildingUpgradeAdd {UpgradeId = 24},
			PlayerBuildingUpgradeAdd {UpgradeId = 26},
			PlayerBuildingUpgradeAdd {UpgradeId = 34},
			PlayerBuildingUpgradeAdd {UpgradeId = 38},
		},
	},
	-- Starten der MapQuesten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndIntroCS"}
		},
		Actions =
		{
			
			QuestSetSolved {Quest = "CityShip2_TeleportToDraghLur"},
			QuestSetSolved {Quest = "CityShip2_To_Dragh_Lur"},
			QuestSetSolved {Quest = "SF1A1_2_Akt_Kapitel1"},
			QuestSetActive {Quest = "SF2A1_2_Akt_Kapitel2"},
			QuestSetActive {Quest = "DraghLurA1_AttackBlades"},
		},
	},
	-- Boss greift an
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {X = 525, Y = 435, Range = 15},
		},
		Actions =
		{
			FigureAttackEntity {Tag = "GateBoss", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "BossAdd1", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "BossAdd2", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "BossAdd3", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "BossAdd4", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "BossAdd5", TargetTag = "pl_HumanAvatar"},
		},
	},
	-- Der Spieler hat das erste Item gefunden, die Fallen werden aktiviert
	OnOneTimeEvent
	{
		Conditions =
		{
		   -- Boss tot
		   FigureIsDead {Tag = "GateBoss"},
		   FigureIsDead {Tag = "BossAdd1"},
		   FigureIsDead {Tag = "BossAdd2"},
		   FigureIsDead {Tag = "BossAdd3"},
		   FigureIsDead {Tag = "BossAdd4"},
		   FigureIsDead {Tag = "BossAdd5"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_AttackBlades"},
			QuestSetActive {Quest = "DraghLurA1_TheTraps"},
			QuestSetActive {Quest = "DraghLurA1_Swampcamps"},
			MapTimerStart {Name = "mt_P407_SecondCS"},
			MapFlagSetTrue {Name = "mf_P407_GateBoss"},
			FogOfWarReveal {X = 340.127, Y = 286.73, Range = 7},
			FogOfWarReveal {X = 252.353, Y = 281.549, Range = 7},
			FogOfWarReveal {X = 581.68, Y = 291.361, Range = 7},
			FogOfWarReveal {X = 572.187, Y = 200.44, Range = 7},
		},
	},
	-- Einzelne Questen solven
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_WeaponPart1"},
			AvatarHasItemMisc {ItemId = 278, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_WeaponPart1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_WeaponPart2"},
			AvatarHasItemMisc {ItemId = 276, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_WeaponPart2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_WeaponPart3"},
			AvatarHasItemMisc {ItemId = 277, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_WeaponPart3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_WeaponPart4"},
			AvatarHasItemMisc {ItemId = 279, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_WeaponPart4"},
		},
	},
	-- Der Spieler hat eine Waffenteil, also wird die Quest aktiv gestellt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking {},
			OR
			{
				AvatarHasItemMisc {ItemId = 276, Amount = 1},
				AvatarHasItemMisc {ItemId = 277, Amount = 1},
				AvatarHasItemMisc {ItemId = 278, Amount = 1},
				AvatarHasItemMisc {ItemId = 279, Amount = 1},
			},
		},
		Actions =
		{
			QuestSetActive {Quest = "DraghLurA1_AntiBladeWeapon"},
			QuestSetActive {Quest = "DraghLurA1_WeaponPart1"},
			QuestSetActive {Quest = "DraghLurA1_WeaponPart2"},
			QuestSetActive {Quest = "DraghLurA1_WeaponPart3"},
			QuestSetActive {Quest = "DraghLurA1_WeaponPart4"},
		}
	},
	-- Der Spieler hat alle Waffenteile, also bekommt er seine Waffe
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 276, Amount = 1},
			AvatarHasItemMisc {ItemId = 277, Amount = 1},
			AvatarHasItemMisc {ItemId = 278, Amount = 1},
			AvatarHasItemMisc {ItemId = 279, Amount = 1},
		},
		Actions =
		{
			AvatarItemMiscTake {ItemId = 276, Amount = 1},
			AvatarItemMiscTake {ItemId = 277, Amount = 1},
			AvatarItemMiscTake {ItemId = 278, Amount = 1},
			AvatarItemMiscTake {ItemId = 279, Amount = 1},
			
			AvatarItemEquipmentGive {ItemId = 888, Amount = 1},
			
			QuestSetSolved {Quest = "DraghLurA1_AntiBladeWeapon"},
			QuestSetActive {Quest = "DraghLurA1_DefeatYsha"},
			QuestSetSolved {Quest = "DraghLurA1_Swampcamps"},
		}
	},
	-- Wenn der Spieler Yasha getötet hat braucht er keine Fallen mehr und die Questen werden weitergeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_YshaAlive"},
			FigureIsDead {Tag = "Ysha"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_DefeatYsha"},
			QuestSetSolved {Quest = "DraghLurA1_TheTraps"},
			QuestSetActive {Quest = "DraghLurA1_TalkToNightsong"},
			DialogSetDisabled {Tag = "Trap1"},
			DialogSetDisabled {Tag = "Trap2"},
			DialogSetDisabled {Tag = "Trap3"},
			DialogSetDisabled {Tag = "Trap4"},
			DialogSetDisabled {Tag = "Trap5"},
			MapFlagSetTrue {Name = "mf_P407_YashaDead"},
			GateSetOpen {Tag = "Fortress_Gate"},
			PlayerBuildingTeamTransfer {Player = "pl_Player2", Team = "tm_Neutral"},
			
		}
	},   
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DraghLurA1_TalkToNightsong"},
		},
		Actions =
		{
			PortalEnable {Tag = "Portal_Ship"},
		},
	},
	-- Wenn die Fallenquest vorbei ist dem SPieler die Fallenitems wieder abnehmen
	OnEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DraghLurA1_TheTraps"},
			AvatarHasItemMisc {Amount = 1, ItemId = 280}
		},
		Actions =
		{
			AvatarItemMiscTake {Amount = 1, ItemId = 280}
		},
	},
	-- Der Spieler hat zum ersten mal eine Falle aktiviert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual {Value = 1, Name = "mv_P407_NumberOfActiveTraps"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_TrapActive"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss1"},
			FigureIsDead {Tag = "CampBoss2"},
			FigureIsDead {Tag = "CampBoss3"},
			FigureIsDead {Tag = "CampBoss4"},
			FigureIsDead {Tag = "EnemyTitan"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_TitanDead"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_CampBoss1"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_CampBoss2"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_CampBoss3"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss4"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_CampBoss4"}
		},
	},
	
}