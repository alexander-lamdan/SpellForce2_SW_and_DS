--Wenn man Alluvyan das zweitemal betritt nach der Belagerung
--*******************************************************
--***                                                 ***
--***             Alluvyan 2 Time		 	          ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "InitState",
--*******************************************************
--***                                                 ***
--***               	InitState	 		          ***
--***                                                 ***
--*******************************************************		
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_ToSevenkeeps"},	
		},
		Actions =
		{
						
			--alle Spieler Gebäude werden neutral und alle Spielereinheiten werden gelöscht.
			PlayerBuildingTeamTransfer	{Player = "pl_Human", Team = "tm_Neutral"},
			
			--WeatherChange	{File = "litAtmo_P403_Sevenkeeps_Sun"},
			FigureVanish	{Tag = "Satras"},
			FigureVanish	{Tag = "Haldor"},
			FigureVanish	{Tag = "Master_Builder"},
			FigureVanish	{Tag = "Observer"},
			FigureVanish	{Tag = "Skjaldir"},
			FigureVanish	{Tag = "Irion"},
			
			FigureVanish	{Tag = "Pat01Guard01"}, 
			FigureVanish	{Tag = "Pat01Guard02"},
			FigureVanish	{Tag = "Pat02Guard01"},
			FigureVanish	{Tag = "Pat02Guard02"},
			FigureVanish	{Tag = "Pat03Guard01"},
			FigureVanish	{Tag = "Pat03Guard02"},
			FigureVanish	{Tag = "Pat04Guard01"},
			FigureVanish	{Tag = "Pat04Guard02"},
			FigureVanish	{Tag = "Pat05Guard01"},
			FigureVanish	{Tag = "Pat05Guard02"},
			FigureVanish	{Tag = "Pat06Guard01"},
			FigureVanish	{Tag = "Pat06Guard02"},
			
			FigureVanish	{Tag = "Dwarf01"}, 
			FigureVanish	{Tag = "Dwarf02"}, 
			FigureVanish	{Tag = "Dwarf03"}, 
			FigureVanish	{Tag = "Dwarf04"}, 
			FigureVanish	{Tag = "Dwarf05"}, 
			FigureVanish	{Tag = "Dwarf06"}, 
			FigureVanish	{Tag = "Dwarf07"}, 
			FigureVanish	{Tag = "Dwarf08"}, 
			FigureVanish	{Tag = "Dwarf09"}, 
			FigureVanish	{Tag = "Dwarf10"}, 
			FigureVanish	{Tag = "Dwarf11"}, 
			FigureVanish	{Tag = "Dwarf12"}, 
			FigureVanish	{Tag = "Dwarf13"}, 
			FigureVanish	{Tag = "Dwarf14"}, 
			FigureVanish	{Tag = "Dwarf15"}, 
			FigureVanish	{Tag = "Dwarf16"}, 
			FigureVanish	{Tag = "Dwarf17"}, 
			FigureVanish	{Tag = "Dwarf18"}, 
			FigureVanish	{Tag = "Dwarf19"}, 
			FigureVanish	{Tag = "Dwarf20"}, 
									
			BuildingHealthSet	{Tag = "Haupthaus01", Percent = 1},
			BuildingHealthSet	{Tag = "Haupthaus02", Percent = 1},
			BuildingHealthSet	{Tag = "Haupthaus03", Percent = 1},
			BuildingHealthSet	{Tag = "House1", Percent = 1},
			BuildingHealthSet	{Tag = "House2", Percent = 1},
			
			AIPlayerDeactivate	{Player = "pl_Realm1"},
			AIPlayerDeactivate	{Player = "pl_Realm2"},
			
			
			ObjectVanish	{Tag = "Gate_Prison"},
			ObjectVanish	{Tag = "Lever_Prison"},
			
			ObjectVanish	{Tag = "Haldor_Gate"},
			ObjectVanish	{Tag = "Haldor_Lever"},
			
			ObjectVanish	{Tag = "Gate_Prison02"},
			ObjectVanish	{Tag = "Lever_Prison02"},
			
			ObjectVanish	{Tag = "Flag1"},
			ObjectVanish	{Tag = "Flag2"},
			ObjectVanish	{Tag = "Flag3"},
			ObjectVanish	{Tag = "Flag4"},
			ObjectVanish	{Tag = "Flag5"},
			ObjectVanish	{Tag = "Flag6"},
			
			ObjectVanish	{Tag = "RealmFlag1"},
			ObjectVanish	{Tag = "RealmFlag2"},
			ObjectVanish	{Tag = "RealmFlag3"},
			ObjectVanish	{Tag = "RealmFlag4"},
			
			FigureVanish	{Tag = "TrebuchetEast"},
			FigureVanish	{Tag = "TrebuchetWest"},
			
			ObjectVanish	{Tag = "Fire1"},
			ObjectVanish	{Tag = "Fire2"},
			ObjectVanish	{Tag = "Fire3"},
			ObjectVanish	{Tag = "Fire4"},
			ObjectVanish	{Tag = "Fire5"},
			ObjectVanish	{Tag = "Fire6"},
			ObjectVanish	{Tag = "Fire7"},
			ObjectVanish	{Tag = "Fire8"},
			ObjectVanish	{Tag = "Fire9"},
			ObjectVanish	{Tag = "Fire10"},
			ObjectVanish	{Tag = "Fire11"},
			ObjectVanish	{Tag = "Fire12"},
			ObjectVanish	{Tag = "Fire13"},
			ObjectVanish	{Tag = "Fire14"},
			ObjectVanish	{Tag = "Fire15"},
			ObjectVanish	{Tag = "Fire16"},
			ObjectVanish	{Tag = "Fire17"},
			ObjectVanish	{Tag = "Fire18"},
			ObjectVanish	{Tag = "Fire19"},
			ObjectVanish	{Tag = "Fire20"},
			
			ObjectVanish	{Tag = "OrcObject1"},
			ObjectVanish	{Tag = "OrcObject2"},
			ObjectVanish	{Tag = "OrcObject3"},
			
			ObjectVanish	{Tag = "Smoke1"},
			
			ObjectVanish	{Tag = "Lamp1"},
			ObjectVanish	{Tag = "Lamp2"},
			ObjectVanish	{Tag = "Lamp3"},
			ObjectVanish	{Tag = "Lamp4"},
			ObjectVanish	{Tag = "Lamp5"},
			ObjectVanish	{Tag = "Lamp6"},
			ObjectVanish	{Tag = "Lamp7"},
			ObjectVanish	{Tag = "Lamp8"},
			ObjectVanish	{Tag = "Lamp9"},
			ObjectVanish	{Tag = "Lamp10"},
			ObjectVanish	{Tag = "Lamp11"},
			ObjectVanish	{Tag = "Lamp12"},
			ObjectVanish	{Tag = "Lamp13"},
			ObjectVanish	{Tag = "Lamp14"},
			ObjectVanish	{Tag = "Lamp15"},
			ObjectVanish	{Tag = "Lamp16"},
			ObjectVanish	{Tag = "Lamp17"},
			ObjectVanish	{Tag = "Lamp18"},
			ObjectVanish	{Tag = "Lamp19"},
			ObjectVanish	{Tag = "Lamp20"},
			ObjectVanish	{Tag = "Lamp21"},
			ObjectVanish	{Tag = "Lamp22"},
			ObjectVanish	{Tag = "Lamp23"},
			ObjectVanish	{Tag = "Lamp24"},
			ObjectVanish	{Tag = "Lamp25"},
			ObjectVanish	{Tag = "Lamp26"},
			ObjectVanish	{Tag = "Lamp27"},
			ObjectVanish	{Tag = "Lamp28"},
			ObjectVanish	{Tag = "Lamp29"},
			ObjectVanish	{Tag = "Lamp30"},
			ObjectVanish	{Tag = "Lamp31"},
			ObjectVanish	{Tag = "Lamp32"},
			ObjectVanish	{Tag = "Lamp33"},
			ObjectVanish	{Tag = "Lamp34"},
			ObjectVanish	{Tag = "Lamp35"},
			ObjectVanish	{Tag = "Lamp36"},
			ObjectVanish	{Tag = "Lamp37"},
			ObjectVanish	{Tag = "Lamp38"},
			ObjectVanish	{Tag = "Lamp39"},
			ObjectVanish	{Tag = "Lamp40"},
			ObjectVanish	{Tag = "Lamp41"},
			ObjectVanish	{Tag = "Lamp42"},
			ObjectVanish	{Tag = "Lamp43"},
			ObjectVanish	{Tag = "Lamp44"},
			ObjectVanish	{Tag = "Lamp45"},
			ObjectVanish	{Tag = "Lamp46"},
			ObjectVanish	{Tag = "Lamp47"},
			ObjectVanish	{Tag = "Lamp48"},
			ObjectVanish	{Tag = "Lamp49"},
			ObjectVanish	{Tag = "Lamp50"},
			ObjectVanish	{Tag = "Lamp51"},
			ObjectVanish	{Tag = "Lamp52"},
			ObjectVanish	{Tag = "Lamp53"},
			ObjectVanish	{Tag = "Lamp54"},
			ObjectVanish	{Tag = "Lamp55"},
			ObjectVanish	{Tag = "Lamp56"},
			ObjectVanish	{Tag = "Lamp57"},
			ObjectVanish	{Tag = "Lamp58"},
			ObjectVanish	{Tag = "Lamp59"},
			ObjectVanish	{Tag = "Lamp60"},
			ObjectVanish	{Tag = "Lamp61"},
			ObjectVanish	{Tag = "Lamp62"},
			ObjectVanish	{Tag = "Lamp63"},
			ObjectVanish	{Tag = "Lamp64"},
			ObjectVanish	{Tag = "Lamp65"},
			
			ObjectVanish	{Tag = "Spears1"},
			ObjectVanish	{Tag = "Spears2"},  
			ObjectVanish	{Tag = "Spears3"},  
			ObjectVanish	{Tag = "Spears4"},  
			ObjectVanish	{Tag = "Spears5"},  
			ObjectVanish	{Tag = "Spears6"},  
			ObjectVanish	{Tag = "Spears7"},  
			ObjectVanish	{Tag = "Spears8"},  
			ObjectVanish	{Tag = "Spears9"},  
			ObjectVanish	{Tag = "Spears10"},  
			ObjectVanish	{Tag = "Spears11"},  
			ObjectVanish	{Tag = "Spears12"},  
			ObjectVanish	{Tag = "Spears13"},  		
			ObjectVanish	{Tag = "Spears14"},  
			ObjectVanish	{Tag = "Spears15"},  
			ObjectVanish	{Tag = "Spears16"},  
			ObjectVanish	{Tag = "Spears17"},  
			ObjectVanish	{Tag = "Spears18"},  
			ObjectVanish	{Tag = "Spears19"},  
			ObjectVanish	{Tag = "Spears20"},  
			ObjectVanish	{Tag = "Spears21"},  
		    ObjectVanish	{Tag = "Spears22"},  
		    ObjectVanish	{Tag = "Spears23"},  
		    ObjectVanish	{Tag = "Spears24"},  
		    ObjectVanish	{Tag = "Spears25"},  
		    ObjectVanish	{Tag = "Spears26"},  
		    ObjectVanish	{Tag = "Spears27"},  
		    ObjectVanish	{Tag = "Spears28"},  
		    ObjectVanish	{Tag = "Spears29"},  
		    ObjectVanish	{Tag = "Spears30"},  
		    ObjectVanish	{Tag = "Spears31"},  
	        ObjectVanish	{Tag = "Spears32"},  
	        ObjectVanish	{Tag = "Spears33"},  
	        ObjectVanish	{Tag = "Spears34"},  
	        ObjectVanish	{Tag = "Spears35"},  
	        ObjectVanish	{Tag = "Spears36"},  
	        ObjectVanish	{Tag = "Spears37"},  
	        ObjectVanish	{Tag = "Spears38"},  
	        ObjectVanish	{Tag = "Spears39"},  
	        ObjectVanish	{Tag = "Spears40"},  
	        ObjectVanish	{Tag = "Spears41"},  
	        ObjectVanish	{Tag = "Spears42"}, 
	        ObjectVanish	{Tag = "Spears43"}, 
	        ObjectVanish	{Tag = "Spears44"},  
			ObjectVanish	{Tag = "Spears45"}, 
			ObjectVanish	{Tag = "Spears46"}, 
			ObjectVanish	{Tag = "Spears47"}, 
			ObjectVanish	{Tag = "Spears48"}, 
			ObjectVanish	{Tag = "Spears49"}, 
			ObjectVanish	{Tag = "Spears50"}, 
			
			ObjectVanish	{Tag = "tent1"},
			ObjectVanish	{Tag = "tent2"},
			ObjectVanish	{Tag = "tent3"},   
			ObjectVanish	{Tag = "tent4"},
			ObjectVanish	{Tag = "tent5"},
			ObjectVanish	{Tag = "tent6"},
			ObjectVanish	{Tag = "tent7"},
			ObjectVanish	{Tag = "tent8"},
			ObjectVanish	{Tag = "tent9"},
			ObjectVanish	{Tag = "tent10"},
			ObjectVanish	{Tag = "tent11"},
			ObjectVanish	{Tag = "tent12"},
			ObjectVanish	{Tag = "tent13"},
			ObjectVanish	{Tag = "tent14"},
			ObjectVanish	{Tag = "tent15"},
			ObjectVanish	{Tag = "tent16"},
			ObjectVanish	{Tag = "tent17"},
			ObjectVanish	{Tag = "tent18"},
			ObjectVanish	{Tag = "tent19"},
			ObjectVanish	{Tag = "tent20"},
			ObjectVanish	{Tag = "tent21"},  
			ObjectVanish	{Tag = "tent22"},  
			ObjectVanish	{Tag = "tent23"},  
			ObjectVanish	{Tag = "tent24"},  
			ObjectVanish	{Tag = "tent25"},  
			ObjectVanish	{Tag = "tent26"},  
			ObjectVanish	{Tag = "tent27"},  
			ObjectVanish	{Tag = "tent28"},  
			ObjectVanish	{Tag = "tent29"},  
			ObjectVanish	{Tag = "tent30"},  
			ObjectVanish	{Tag = "tent31"},  
			ObjectVanish	{Tag = "tent32"},  
			ObjectVanish	{Tag = "tent33"},  
			ObjectVanish	{Tag = "tent34"},  
			ObjectVanish	{Tag = "tent35"},  
			ObjectVanish	{Tag = "tent36"},  
			ObjectVanish	{Tag = "tent37"},  
			ObjectVanish	{Tag = "tent38"},  
			ObjectVanish	{Tag = "tent39"},  
			ObjectVanish	{Tag = "tent40"},  
			ObjectVanish	{Tag = "tent41"},  
			ObjectVanish	{Tag = "tent42"},  
			ObjectVanish	{Tag = "tent43"},  
			ObjectVanish	{Tag = "tent44"},  
			ObjectVanish	{Tag = "tent45"},  
			ObjectVanish	{Tag = "tent46"},  
			ObjectVanish	{Tag = "tent47"},  
			ObjectVanish	{Tag = "tent48"},  
			ObjectVanish	{Tag = "tent49"},  
			ObjectVanish	{Tag = "tent50"},  
			ObjectVanish	{Tag = "tent51"},  
			ObjectVanish	{Tag = "tent52"},  
			ObjectVanish	{Tag = "tent53"},  
			ObjectVanish	{Tag = "tent54"},  
			ObjectVanish	{Tag = "tent55"},  
			ObjectVanish	{Tag = "tent56"},  
			ObjectVanish	{Tag = "tent57"},  
			ObjectVanish	{Tag = "tent58"},  
			ObjectVanish	{Tag = "tent59"},  
			 
			ObjectVanish	{Tag = "UndeadWall1"},
			ObjectVanish	{Tag = "UndeadWall2"},
			ObjectVanish	{Tag = "UndeadWall3"}, 
			ObjectVanish	{Tag = "UndeadWall4"}, 
			 
			ObjectChange	{Tag = "TowerBroken1", ObjectId = 140, X = 394.8, Y = 411.6, Direction = 270},
			ObjectChange	{Tag = "TowerBroken5", ObjectId = 140, X = 309.256, Y = 385.286,  Direction = 315}, 
			ObjectChange	{Tag = "TowerBroken6", ObjectId = 140, X = 437.853, Y = 382.597,  Direction = 45}, 
			ObjectChange	{Tag = "TowerBroken7", ObjectId = 140, X = 441.654, Y = 386.736,  Direction = 45}, 
			
			ObjectVanish	{Tag = "Slave1"}, 
			ObjectVanish	{Tag = "Slave2"}, 
			ObjectVanish	{Tag = "Slave3"}, 
			ObjectVanish	{Tag = "Slave4"}, 
			ObjectVanish	{Tag = "Slave5"}, 
			ObjectVanish	{Tag = "Slave6"},  
			
			PlayerResourceLenyaTake	{Player = "pl_Human", Amount = 10000},
			PlayerResourceSilverTake	{Player = "pl_Human", Amount = 10000},
			PlayerResourceStoneTake	{Player = "pl_Human", Amount = 10000},
		},  
		    
	},      
		    
	 OnOneTimeEvent
	{
		Conditions =
		{
			BuildingHasNotHealth	{Tag = "Haupthaus01", Percent = 10},
			BuildingHasNotHealth	{Tag = "Haupthaus02", Percent = 10},
			BuildingHasNotHealth	{Tag = "Haupthaus03", Percent = 10},
			BuildingHasNotHealth	{Tag = "House1", Percent = 10},
			BuildingHasNotHealth	{Tag = "House2", Percent = 10},
			
		},
		Actions =
		{
			
			BuildingDestroy	{Tag = "Haupthaus01"},
			BuildingDestroy	{Tag = "Haupthaus02"},
			BuildingDestroy	{Tag = "Haupthaus03"},
			BuildingDestroy	{Tag = "House1"},
			BuildingDestroy	{Tag = "House2"},
			
			
		},  
		    
	},      
	 
	 
	 
	        
};          
            
            
            
            
            
            
            
            
            
            
            
            