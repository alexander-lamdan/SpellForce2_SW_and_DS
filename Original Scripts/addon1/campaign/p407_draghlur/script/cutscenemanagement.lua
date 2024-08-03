State
{
	StateName = "Cutscenes",
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Es gibt keine Startbedingungen für die Introcutscene
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_StartIntroCS"},			
		},
	},
	-- Wenn die Cutscene vorbei ist werden Questen gesolved etc
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndIntroCS"}
		},
		Actions =
		{
			PlayerKitTransfer {PlayerKit = "pk_GiveBuildings"},
			FigureVanish {},
		},
	},
	-- Wenn der Spieler das Item für die Fallen hat werden diese erklärt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P407_SecondCS", Seconds = 3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_StartTrapsCS"},
			BuildingDestroy {Tag = "Nexus"},
			BuildingDestroy {Tag = "Nexus2"},
			AvatarItemMiscGive {ItemId = 280, Amount = 2},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
			PlayerTravelDisable {},
		},
	},
	
	-- Nach der Fallencutscene werden der obere Aufbau weggenommen und der untere Aktiviert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndTrapsCS"}
		},
		Actions =
		{
			PlayerBuildingTeamTransfer {Team = "tm_Team1"},
			PlayerKitTransfer {PlayerKit = "pk_NewHQ"},
			-- Zur SIcherheit werden alle Blades innerhalb der Festung getötet
			FigureKill {Tag = "FortressFightBad1"},
			FigureKill {Tag = "FortressFightBad2"},
			FigureKill {Tag = "FortressFightBad3"},
			FigureKill {Tag = "FortressFightBad4"},
			FigureKill {Tag = "FortressFightBad5"},
			FigureKill {Tag = "FortressFightBad6"},
			FigureKill {Tag = "FortressFightBad7"},
			FigureKill {Tag = "FortressFightBad8"},
			FigureKill {Tag = "FortressFightBad9"},
			FigureKill {Tag = "FortressFightBad10"},
			FigureKill {Tag = "FortressFightBad11"},
			FigureKill {Tag = "FortressFightBad12"},
			FigureKill {Tag = "FortressFightBad13"},
			FigureKill {Tag = "FortressFightBad14"},
			FigureKill {Tag = "FortressFightBad15"},
			FigureKill {Tag = "FortressFightBad16"},
			FigureKill {Tag = "FortressFightBad17"},
			FigureKill {Tag = "FortressFightBad18"},
			FigureKill {Tag = "FortressFightBad19"},
			FigureKill {Tag = "FortressFightBad20"},
			FigureKill {Tag = "FortressFightBad21"},
			FigureKill {Tag = "FortressFightBad22"},
			FigureKill {Tag = "FortressFightBad23"},
			FigureKill {Tag = "FortressFightBad24"},
			FigureKill {Tag = "FortressFightBad25"},
			FigureKill {Tag = "FortressFightBad26"},
			
			PlayerActivate {Player = "pl_Player2"},	
			PlayerBuildingUpgradeAdd {UpgradeId = 28},
			PlayerBuildingUpgradeAdd {UpgradeId = 32},
			AtmoZoneChange {Tag = "FortressSound", AtmoDay = "00_atmoset_dragh_lur_day", AtmoNight = "00_atmoset_dragh_lur_night"},
		},
	},
	-- Der Spieler hat einen Teil der Waffe, also werden sie erklärt
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_03"},
				QuestIsActive {Quest = "DraghLurA1_AntiBladeWeapon"},
			},
		},
		Actions =
		{          
			MapFlagSetTrue {Name = "mf_P407_StartWeaponCS"},
			-- In der CS ist auch Schattenlied aufgetaucht und wird zur Heldin
			FigureVanish {Tag = "SHADOWSONG"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 25},
			NoSpawnEffect {Spawn = FigureHeroSpawn {Tag = "Nightsong", X = 408.462, Y = 659.02, Direction = 90},},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "_OutrcyNoteNpc", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
    		FigureOutcry {Tag = "_OutrcyNoteNpc", TextTag = "NightsongJoinsGroup"},
    		FigureVanish {Tag = "_OutrcyNoteNpc"},
		},
	},
	-- Waffencutscene vorbei
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndWeaponCS"},
		},
		Actions =
		{
		},
	},
	--Yasha tot
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_04"},
				QuestIsSolved {Quest = "DraghLurA1_DefeatYsha"},
			},
		},
		Actions =
		{                 
			PlayerHeroAdd {Player = "pl_Human", HeroId = 110},
			NoSpawnEffect {Spawn = FigureHeroSpawn {Tag = "HeroYasha", X = 334, Y = 50, Direction = 90},},
			MapFlagSetTrue {Name = "mf_P407_StartYashaCS"},
			
			-- wird global geregelt über HeroAbilities.lua !!!
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "_OutrcyNoteNpc", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
    		--FigureOutcry {Tag = "_OutrcyNoteNpc", TextTag = "YashaJoinsGroup"},
    		--FigureOutcry {Tag = "_OutrcyNoteNpc", TextTag = "YashaJoinsAbility"},
    		--FigureVanish {Tag = "_OutrcyNoteNpc"},
		},
	},
	--Yasha tot, Cutscene gelaufen ---> Yasha Held
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndYashaCS"},
		},
		Actions =
		{   
			ObjectVanish {Tag = "Barrier"},
			PlayerTravelStoneAdd {Tag = "FortressAfterFight"},
		},
	},
}