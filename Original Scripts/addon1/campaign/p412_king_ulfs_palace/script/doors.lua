--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    Doors			                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--Zelltür
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 336, Amount = 1},
    	 },
    	Actions = 
    	{
    		DialogTypeSetSideQuest	{Tag = "CellGate1"},
    		DialogTypeSetSideQuest	{Tag = "CellGate3"},
    		DialogTypeSetSideQuest	{Tag = "CellGate4"},
    		DialogTypeSetSideQuest	{Tag = "CellGate5"},
    		DialogTypeSetSideQuest	{Tag = "CellGate6"},
    		DialogTypeSetSideQuest	{Tag = "CellGate7"},
    		DialogTypeSetSideQuest	{Tag = "CellPLaceholder2"},  --KingUlf		
			DialogTypeSetSideQuest	{Tag = "CellPLaceholder9"},  --Folterraum
    		DialogSetEnabled	{Tag = "CellGate1"},
    		DialogSetEnabled	{Tag = "CellGate3"},
    		DialogSetEnabled	{Tag = "CellGate4"},
    		DialogSetEnabled	{Tag = "CellGate5"},
    		DialogSetEnabled	{Tag = "CellGate6"},
    		DialogSetEnabled	{Tag = "CellGate7"},
    		DialogSetEnabled	{Tag = "CellPLaceholder2"},
    		DialogSetEnabled	{Tag = "CellPLaceholder9"},
    	},
    	
    }, 
       
    --Weinkellergate
    OnOneTimeLeverEvent	
	{
		Lever = "LeverWineGate", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "WineDoor"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 236, Y = 15, Z = 103, MaxRange = 15, FallOffRange = 5},
		},
	},
    
    --StockRoomDoor
    OnOneTimeLeverEvent	
	{
		Lever = "LeverStockRoom", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "StockRoomDoor"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 215, Y = 20, Z = 141, MaxRange = 15, FallOffRange = 5},
		},
	},
	
	--ThiefPrison
    OnOneTimeLeverEvent	
	{
		Lever = "LeverThief", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GateCellThief"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_grate_open", X = 249, Y = 15, Z = 75, MaxRange = 15, FallOffRange = 5},
		},
	},
	
   	
    --SecretDoor 1 
    OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "SecretDoor1"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "GuradsGate1"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_grate_open", X = 116, Y = 15, Z = 109, MaxRange = 15, FallOffRange = 5},
			GateSetOpen	{Tag = "GuradsGate2"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 116, Y = 19, Z = 126, MaxRange = 15, FallOffRange = 5},
		},
		
	},
	
  	--SecretDoor 4 
    OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 3, X = 105, Y = 174},
		},
		Actions =
		{
			GateSetOpen	{Tag = "SecretDoor4"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 116, Y = 20, Z = 176, MaxRange = 15, FallOffRange = 5},
		},
		
	},
  
    --Tempeltür
    OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			BuildingIsDead	{Tag = "EarthBase"},
			BuildingIsDead	{Tag = "FireBase"},
			BuildingIsDead	{Tag = "WindBase"},
			BuildingIsDead	{Tag = "IceBae"},
			FigureIsDead	{Tag = "ElementalMage"},
			FigureIsDead	{Tag = "IceElemental1"},
			FigureIsDead	{Tag = "IceElemental2"},
			FigureIsDead	{Tag = "EarthElemental1"},
			FigureIsDead	{Tag = "EarthElemental2"},
			FigureIsDead	{Tag = "FireElemental1"},
			FigureIsDead	{Tag = "FireElemental2"},
			FigureIsDead	{Tag = "WindElemental1"},
			FigureIsDead	{Tag = "WindElemental2"},
			
		},
		Actions =
		{
			GateSetOpen	{Tag = "TempleOutGate"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 114, Y = 20, Z = 252, MaxRange = 15, FallOffRange = 5},
		},
		
	},
	
	--Templetür-Bibliothek
	OnToggleEvent	
	{
		OnConditions =
		{
			GateIsOpen	{Tag = "TempleOutGate"},
			GateIsClosed	{Tag = "GateTeleportRoom"},
			GateIsClosed	{Tag = "TempleDoor"},
		},
		OnActions = 
		{
			GateSetOpen	{Tag = "TempleDoor"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 123, Y = 20, Z = 242, MaxRange = 15, FallOffRange = 5},
		},
		OffConditions =
		{
			GateIsOpen	{Tag = "TempleOutGate"},
			GateIsOpen	{Tag = "GateTeleportRoom"},
			GateIsOpen	{Tag = "TempleDoor"},
		},
		OffActions = 
		{
			GateSetClosed	{Tag = "TempleDoor"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_close", X = 123, Y = 20, Z = 242, MaxRange = 15, FallOffRange = 5},
		},
		
	},
	
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "MonsterRoom36_1"},
			FigureIsDead	{Tag = "MonsterRoom36_2"},
			FigureIsDead	{Tag = "MonsterRoom37_1"},
			FigureIsDead	{Tag = "MonsterRoom37_2"},
			FigureIsDead	{Tag = "MonsterRoom38_1"},
			FigureIsDead	{Tag = "MonsterRoom38_2"},
			FigureIsDead	{Tag = "MonsterRoom39_1"},
			FigureIsDead	{Tag = "MonsterRoom39_2"},
			FigureIsDead	{Tag = "MonsterRoom40_1"},
			FigureIsDead	{Tag = "MonsterRoom40_2"},	
			FigureIsDead	{Tag = "MonsterRoom41_1"},
			FigureIsDead	{Tag = "MonsterRoom41_2"},
		},
		OnActions = 
		{
			GateSetOpen	{Tag = "GateTeleportRoom"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 87, Y = 20, Z = 224, MaxRange = 15, FallOffRange = 5},
		},
		OffConditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			OR
			{
				FigureIsAlive	{Tag = "MonsterRoom36_1"},
				FigureIsAlive	{Tag = "MonsterRoom36_2"},
				FigureIsAlive	{Tag = "MonsterRoom37_1"},
				FigureIsAlive	{Tag = "MonsterRoom37_2"},
				FigureIsAlive	{Tag = "MonsterRoom38_1"},
				FigureIsAlive	{Tag = "MonsterRoom38_2"},
				FigureIsAlive	{Tag = "MonsterRoom39_1"},
				FigureIsAlive	{Tag = "MonsterRoom39_2"},
				FigureIsAlive	{Tag = "MonsterRoom40_1"},
				FigureIsAlive	{Tag = "MonsterRoom40_2"},	
				FigureIsAlive	{Tag = "MonsterRoom41_1"},
				FigureIsAlive	{Tag = "MonsterRoom41_2"},
			},
		},
		OffActions = 
		{
			GateSetClosed	{Tag = "GateTeleportRoom"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_close", X = 87, Y = 20, Z = 224, MaxRange = 15, FallOffRange = 5},
		},
		
	},
	
    
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "Necromancer"},
			FigureIsDead	{Tag = "Illusionist"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "FloorGate"},
			DialogSetDisabled	{Tag = "KingUlfFloorGate"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 151, Y = 20, Z = 176, MaxRange = 15, FallOffRange = 5},
		},
		
	},
	
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "FloorGate"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Guard1", X = 155, Y = 175},
			FigureWalk	{Tag = "Guard2", X = 153, Y = 174},
			FigureWalk	{Tag = "Guard3", X = 153, Y = 176},
			FigureWalk	{Tag = "Guard4", X = 151, Y = 174},
			FigureWalk	{Tag = "Guard5", X = 151, Y = 176},
		},
		
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "Illusionist"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "EatingRoomDoor"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 248, Y = 20, Z = 194, MaxRange = 15, FallOffRange = 5},
			GateSetOpen	{Tag = "KitchenDoor"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 237, Y = 20, Z = 161, MaxRange = 15, FallOffRange = 5},
		},
		
	},
   
};