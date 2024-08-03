--Wenn man Siebenburg das zweitemal betritt nach der Belagerung
--*******************************************************
--***                                                 ***
--***             Sevenkeeps 2 Time		 	          ***
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
			QuestIsSolved {Quest = "SevenkeepsA1_PortToGhostwatch"},	
		},
		Actions =
		{
			BackdropShow	{Tag = "Backdrop_Cityship"},			
			WeatherChange	{File = "litAtmo_P403_Sevenkeeps_Sun"},
			
			ObjectVanish	{Tag = "Tower8Pact3"},
			ObjectVanish	{Tag = "Tower9Pact3"},
			ObjectVanish	{Tag = "Tower10Pact3"},
			ObjectVanish	{Tag = "Tower11Pact3"},
			ObjectVanish	{Tag = "Tower12Pact3"},
			ObjectVanish	{Tag = "Tower1Pact3"},
			ObjectVanish	{Tag = "Tower2Pact3"},
			ObjectVanish	{Tag = "Tower3Pact3"},
			ObjectVanish	{Tag = "Tower4Pact3"},
			ObjectVanish	{Tag = "Tower5Pact3"},
			ObjectVanish	{Tag = "Tower6Pact3"},
			ObjectVanish	{Tag = "Tower7Pact3"},
			
			ObjectVanish	{Tag = "Tower1Pact5"},
			ObjectVanish	{Tag = "Tower2Pact5"},
			
			ObjectVanish	{Tag = "Tower1Pact2"},
			ObjectVanish	{Tag = "Tower2Pact2"},
			ObjectVanish	{Tag = "Tower3Pact2"},
			ObjectVanish	{Tag = "Tower4Pact2"},
			ObjectVanish	{Tag = "Tower5Pact2"},
			ObjectVanish	{Tag = "Tower6Pact2"},
			ObjectVanish	{Tag = "Tower7Pact2"},
			ObjectVanish	{Tag = "Tower8Pact2"},
			
			ObjectVanish	{Tag = "Tower1Pact4"},
			ObjectVanish	{Tag = "Tower2Pact4"},
			ObjectVanish	{Tag = "Tower3Pact4"},
			ObjectVanish	{Tag = "Tower4Pact4"},
			ObjectVanish	{Tag = "Tower5Pact4"},
			ObjectVanish	{Tag = "Tower6Pact4"},
						
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
						
			ObjectVanish	{Tag = "Tent1"},
			ObjectVanish	{Tag = "Tent2"},
			ObjectVanish	{Tag = "Tent3"},
			ObjectVanish	{Tag = "Tent4"},
			ObjectVanish	{Tag = "Tent5"},
			ObjectVanish	{Tag = "Tent6"},
			ObjectVanish	{Tag = "Tent7"},
			ObjectVanish	{Tag = "Tent8"},
			ObjectVanish	{Tag = "Tent9"},
			ObjectVanish	{Tag = "Tent10"},
			ObjectVanish	{Tag = "Tent11"},
			ObjectVanish	{Tag = "Tent12"},
			ObjectVanish	{Tag = "Tent13"},
			ObjectVanish	{Tag = "Tent14"},
			ObjectVanish	{Tag = "Tent15"},
			ObjectVanish	{Tag = "Tent16"},
			ObjectVanish	{Tag = "Tent17"},
			ObjectVanish	{Tag = "Tent18"},
			ObjectVanish	{Tag = "Tent19"},
			ObjectVanish	{Tag = "Tent20"},
			ObjectVanish	{Tag = "Tent21"},
			ObjectVanish	{Tag = "Tent22"},
			ObjectVanish	{Tag = "Tent23"},
			ObjectVanish	{Tag = "Tent24"},
			ObjectVanish	{Tag = "Tent25"},
			ObjectVanish	{Tag = "Tent26"},
			
			ObjectVanish	{Tag = "Flag1"},
			ObjectVanish	{Tag = "Flag2"},
			ObjectVanish	{Tag = "Flag3"},
			ObjectVanish	{Tag = "Flag4"},
			ObjectVanish	{Tag = "Flag5"},
			ObjectVanish	{Tag = "Flag6"},
			ObjectVanish	{Tag = "Flag7"},
			ObjectVanish	{Tag = "Flag8"},
			
			ObjectVanish	{Tag = "Stone1"},
			ObjectVanish	{Tag = "Stone2"},
			ObjectVanish	{Tag = "Stone3"},
			ObjectVanish	{Tag = "Stone4"},
			ObjectVanish	{Tag = "Stone5"},
			ObjectVanish	{Tag = "Stone6"},
			ObjectVanish	{Tag = "Stone7"},
			ObjectVanish	{Tag = "Stone8"},
			ObjectVanish	{Tag = "Stone9"},
			ObjectVanish	{Tag = "Stone10"},
			ObjectVanish	{Tag = "Stone11"},
			ObjectVanish	{Tag = "Stone12"},
			ObjectVanish	{Tag = "Stone13"},
			ObjectVanish	{Tag = "Stone14"},
			ObjectVanish	{Tag = "Stone15"},
			ObjectVanish	{Tag = "Stone16"},
			ObjectVanish	{Tag = "Stone17"},
			ObjectVanish	{Tag = "Stone18"},
			ObjectVanish	{Tag = "Stone19"},
			ObjectVanish	{Tag = "Stone20"},
			ObjectVanish	{Tag = "Stone21"},
			ObjectVanish	{Tag = "Stone22"},
			ObjectVanish	{Tag = "Stone23"},
			ObjectVanish	{Tag = "Stone24"},
			ObjectVanish	{Tag = "Stone25"},
			ObjectVanish	{Tag = "Stone26"},
			
			FigureVanish	{Tag = "Trebuchet1"},
			FigureVanish	{Tag = "Trebuchet3"},
			FigureVanish	{Tag = "Trebuchet4"},
			FigureVanish	{Tag = "Trebuchet5"},
			
		
			ObjectVanish	{Tag = "Blocker1"},
			ObjectVanish	{Tag = "Blocker2"},
			ObjectVanish	{Tag = "Blocker3"},
			ObjectVanish	{Tag = "Blocker4"},
			
			ObjectVanish	{Tag = "PactTent1"},
			ObjectVanish	{Tag = "PactTent2"},
			
			ObjectVanish	{Tag = "ChefTrackCamp1"},
			ObjectVanish	{Tag = "ChefTrackCamp2"},
			
			FigureVanish	{Tag = "Ulf"},
			FigureVanish	{Tag = "Riddengard"},
			FigureVanish	{Tag = "GeneralKaran"},
			FigureVanish	{Tag = "Halicos"},
			FigureVanish	{Tag = "Greif01"},
			FigureVanish	{Tag = "Greif02"},
			FigureVanish	{Tag = "Greif03"},
			FigureVanish	{Tag = "Greif04"},
			FigureVanish	{Tag = "Greif05"},
			FigureVanish	{Tag = "Greif06"},
			FigureVanish	{Tag = "StormTroop1"},
			FigureVanish	{Tag = "StormTroop2"},
			FigureVanish	{Tag = "StormTroop3"},
			FigureVanish	{Tag = "StormTroop4"},
			FigureVanish	{Tag = "StormTroop5"},
			FigureVanish	{Tag = "StormTroop6"},
			FigureVanish	{Tag = "StormTroop7"},
			FigureVanish	{Tag = "StormTroop8"},
			FigureVanish	{Tag = "StormTroop9"},
			FigureVanish	{Tag = "StormTroop10"},
			FigureVanish	{Tag = "StormTroop11"},
			FigureVanish	{Tag = "StormTroop12"},
			FigureVanish	{Tag = "StormTroop13"},
			FigureVanish	{Tag = "StormTroop14"},
			FigureVanish	{Tag = "StormTroop15"},
			FigureVanish	{Tag = "StormTroop16"},
			FigureVanish	{Tag = "StormTroop17"},
			FigureVanish	{Tag = "StormTroop18"},
			FigureVanish	{Tag = "StormTroop19"},
			FigureVanish	{Tag = "StormTroop20"},
			FigureVanish	{Tag = "StormTroop21"},
			FigureVanish	{Tag = "StormTroop22"},
			FigureVanish	{Tag = "StormTroop23"},
			FigureVanish	{Tag = "StormTroop24"},
			FigureVanish	{Tag = "StormTroop25"},
			FigureVanish	{Tag = "StormTroop26"},
			FigureVanish	{Tag = "StormTroop27"},
			FigureVanish	{Tag = "StormTroop28"},
			FigureVanish	{Tag = "StormTroop29"},
			FigureVanish	{Tag = "StormTroop30"},
			FigureVanish	{Tag = "StormTroop31"},
			FigureVanish	{Tag = "StormTroop32"},
			FigureVanish	{Tag = "StormTroop33"},
			FigureVanish	{Tag = "StormTroop34"},
			FigureVanish	{Tag = "StormTroop35"},
			FigureVanish	{Tag = "StormTroop36"},
			FigureVanish	{Tag = "StormTroop37"},
			FigureVanish	{Tag = "StormTroop38"},
			FigureVanish	{Tag = "StormTroop39"},
			FigureVanish	{Tag = "StormTroop40"},
			
			FigureVanish	{Tag = "Wolf1"},
			FigureVanish	{Tag = "Wolf2"},
			FigureVanish	{Tag = "Wolf3"},
			FigureVanish	{Tag = "Wolf4"},
			FigureVanish	{Tag = "Wolf5"},
			FigureVanish	{Tag = "Wolf6"},
			FigureVanish	{Tag = "Wolf7"},
			FigureVanish	{Tag = "Wolf8"},
			FigureVanish	{Tag = "Wolf9"},
			FigureVanish	{Tag = "Wolf10"},
			FigureVanish	{Tag = "Wolf11"},
			FigureVanish	{Tag = "Wolf12"},
			FigureVanish	{Tag = "Wolf13"},
			FigureVanish	{Tag = "Wolf14"},
			FigureVanish	{Tag = "Wolf15"},
			FigureVanish	{Tag = "Wolf16"},
			FigureVanish	{Tag = "Wolf17"},
			FigureVanish	{Tag = "Wolf18"},
			
			FigureVanish	{Tag = "Bear1"},
			FigureVanish	{Tag = "Bear2"},
			FigureVanish	{Tag = "Bear3"},
			FigureVanish	{Tag = "Bear4"},
			FigureVanish	{Tag = "Bear5"},
		},
		
	},
		OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "CityShip4_TeleportWestguard"},	
		},
		Actions =
		{		
			PortalEnable {Tag = "GoldenFields_Westguard"},
		},
		
	},
	
	
};




