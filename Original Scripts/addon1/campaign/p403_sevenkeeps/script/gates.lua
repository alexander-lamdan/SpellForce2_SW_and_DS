--Die Gates von Siebenburg

--*******************************************************
--***                                                 ***
--***             Gates of Sevencities  	          ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "InitState",
--*******************************************************
--***                                                 ***
--***               	SwitchState   		          ***
--***                                                 ***
--*******************************************************		
	OnOneTimeEvent
	{
		Conditions =
		{
		
			
		},
		Actions =
		{
			LeverSetDisabled	{Tag = "LeverPactMainGate1"},
			LeverSetDisabled	{Tag = "LeverPactMainGate2"},
			LeverSetDisabled	{Tag = "LeverElfenGate01"},
			LeverSetDisabled	{Tag = "LeverElfenGate02"},
			LeverSetDisabled	{Tag = "LeverGateGarnisson01"},
			LeverSetDisabled	{Tag = "LeverGateGarnisson02"},
			LeverSetDisabled	{Tag = "LeverGateGarnisson03"},
			LeverSetDisabled	{Tag = "LeverGateSouth"},
			
		},
		
	},	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
			
		},
		Actions =
		{
			GateSetOpen	{Tag = "HouseGate"},	
		},
		
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},	
		},
		Actions =
		{
			LeverSetEnabled	{Tag = "LeverPactMainGate1"},
			LeverSetEnabled	{Tag = "LeverPactMainGate2"},
			LeverSetEnabled	{Tag = "LeverElfenGate01"},
			LeverSetEnabled	{Tag = "LeverElfenGate02"},
			LeverSetEnabled	{Tag = "LeverGateGarnisson01"},
			LeverSetEnabled	{Tag = "LeverGateGarnisson02"},
			LeverSetEnabled	{Tag = "LeverGateGarnisson03"},
			LeverSetEnabled	{Tag = "LeverGateSouth"},
		},
		GotoState = "LeverSystem",	
	},
};

State
{	
	StateName = "LeverSystem",
--*******************************************************
--***                                                 ***
--***               LeverSystem   		              ***
--***                                                 ***
--*******************************************************	

--*******************************************************
--***                                                 ***
--***                 PactMainGate01 			       ***
--***                                                 ***
--*******************************************************		

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverPactMainGate1", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "PactMainGate01"},
			EntityFlagIsFalse {Name = "ef_PactMainGate01IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "PactMainGate01"},
			EntityTimerStart	{Name = "et_PactTimer"},
			EntityFlagSetTrue {Name = "ef_PactMainGate01IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_PactMainGate01IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_PactTimer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "PactMainGate01"},
--			EntityFlagSetFalse {Name = "ef_PactMainGate01IsOpen"},
--			EntityTimerStop	{Name = "et_PactTimer"},
--		},
--		
--	},	
--*******************************************************
--***                                                 ***
--***                 PactMainGate02 			       ***
--***                                                 ***
--*******************************************************		

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverPactMainGate2", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "PactMainGate02"},
			EntityFlagIsFalse {Name = "ef_PactMainGate02IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "PactMainGate02"},
			EntityTimerStart	{Name = "et_Pact2Timer"},
			EntityFlagSetTrue {Name = "ef_PactMainGate02IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_PactMainGate02IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_Pact2Timer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "PactMainGate02"},
--			EntityFlagSetFalse {Name = "ef_PactMainGate02IsOpen"},
--			EntityTimerStop	{Name = "et_Pact2Timer"},
--		},
--		
--	},	

--*******************************************************
--***                                                 ***
--***                 DwarfGate01  		              ***
--***                                                 ***
--*******************************************************		

	OnOneTimeEvent
	{
		Conditions =
		{
		
		},
		Actions =
		{
			GateSetOpen	{Tag = "DwarfGate01"},
		},
		
	},	


--*******************************************************
--***                                                 ***
--***                 DwarfGate02  		              ***
--***                                                 ***
--*******************************************************		



--*******************************************************
--***                                                 ***
--***                 ElfenGate01 			          ***
--***                                                 ***
--*******************************************************			

OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverElfenGate01", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "ElfenGate01"},
			EntityFlagIsFalse {Name = "ef_ElfenGate01IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "ElfenGate01"},
			EntityTimerStart	{Name = "et_ElfenTimer"},
			EntityFlagSetTrue {Name = "ef_ElfenGate01IsOpen"},
		},	
	},
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_ElfenGate01IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_ElfenTimer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "ElfenGate01"},
--			EntityFlagSetFalse {Name = "ef_ElfenGate01IsOpen"},
--			EntityTimerStop	{Name = "et_ElfenTimer"},
--		},
--		
--	},		

--*******************************************************
--***                                                 ***
--***                 ElfenGate02 			          ***
--***                                                 ***
--*******************************************************			

OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverElfenGate02", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "ElfenGate02"},
			EntityFlagIsFalse {Name = "ef_ElfenGate02IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "ElfenGate02"},
			EntityTimerStart	{Name = "et_Elfen2Timer"},
			EntityFlagSetTrue {Name = "ef_ElfenGate02IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_ElfenGate02IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_Elfen2Timer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "ElfenGate02"},
--			EntityFlagSetFalse {Name = "ef_ElfenGate02IsOpen"},
--			EntityTimerStop	{Name = "et_Elfen2Timer"},
--		},
--		
--	},		

--*******************************************************
--***                                                 ***
--***                 GarnisonGate01		          ***
--***                                                 ***
--*******************************************************			

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverGateGarnisson01", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "GarnisonGate03"},
			EntityFlagIsFalse {Name = "ef_GarnisonGate01IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GarnisonGate03"},
			EntityTimerStart	{Name = "et_GarnisonTimer"},
			EntityFlagSetTrue {Name = "ef_GarnisonGate01IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_GarnisonGate01IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_GarnisonTimer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "GarnisonGate03"},
--			EntityFlagSetFalse {Name = "ef_GarnisonGate01IsOpen"},
--			EntityTimerStop	{Name = "et_GarnisonTimer"},
--		},
--		
--	},		

--*******************************************************
--***                                                 ***
--***                 GarnisonGate02		          ***
--***                                                 ***
--*******************************************************			

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverGateGarnisson02", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "GarnisonGate01"},
			EntityFlagIsFalse {Name = "ef_GarnisonGate02IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GarnisonGate01"},
			EntityTimerStart	{Name = "et_Garnison2Timer"},
			EntityFlagSetTrue {Name = "ef_GarnisonGate02IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_GarnisonGate02IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_Garnison2Timer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "GarnisonGate01"},
--			EntityFlagSetFalse {Name = "ef_GarnisonGate02IsOpen"},
--			EntityTimerStop	{Name = "et_Garnison2Timer"},
--		},
--		
--	},
	
--*******************************************************
--***                                                 ***
--***                 GarnisonGate03		          ***
--***                                                 ***
--*******************************************************			

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverGateGarnisson03", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "GarnisonGate02"},
			EntityFlagIsFalse {Name = "ef_GarnisonGate03IsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GarnisonGate02"},
			EntityTimerStart	{Name = "et_Garnison3Timer"},
			EntityFlagSetTrue {Name = "ef_GarnisonGate03IsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_GarnisonGate03IsOpen"},
--			EntityTimerIsElapsed	{Name = "et_Garnison3Timer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "GarnisonGate02"},
--			EntityFlagSetFalse {Name = "ef_GarnisonGate03IsOpen"},
--			EntityTimerStop	{Name = "et_Garnison3Timer"},
--		},
--		
--	},			
--	
	
--*******************************************************
--***                                                 ***
--***                 GateGateSouth			          ***
--***                                                 ***
--*******************************************************			

	OnLeverEvent	
	{
		Delay = default, 
		Lever = "LeverGateSouth", 
		OnConditions = 
		{
			GateIsClosed	{Tag = "HumanGateSouth"},
			EntityFlagIsFalse {Name = "ef_GateSouthIsOpen"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "HumanGateSouth"},
			EntityTimerStart	{Name = "et_GateSouthTimer"},
			EntityFlagSetTrue {Name = "ef_GateSouthIsOpen"},
		},	
	},
	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_GateSouthIsOpen"},
--			EntityTimerIsElapsed	{Name = "et_GateSouthTimer", Seconds = 15},	
--		},
--		Actions =
--		{
--			GateSetClosed	{Tag = "HumanGateSouth"},
--			EntityFlagSetFalse {Name = "ef_GateSouthIsOpen"},
--			EntityTimerStop	{Name = "et_GateSouthTimer"},
--		},
--		
--	},				
	
	--Wenn der Spieler die Karte zum zweiten mal betritt sind alle Gates offen und die Lever werden gelöscht.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
			
		},
		
	},		
};


			
